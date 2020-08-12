#!/bin/bash

# Assumes emacs/spacemacs, make, go, and zsh are already installed.

set -e

# Given an absolute path to a submodule directory
# and some directory where it should be
# symlinked, if the symlink doesn't exist, create it and update the
# submodule.
function submodule_symlink() {
    local abs_submodule_dir="$1"
    local install_dir="$2"

    local submodule_dir_name=$(basename "$abs_submodule_dir")

    mkdir -p "$install_dir"
    if [[ ! -e "$install_dir/$submodule_dir_name" ]]; then
        git submodule update --init --recursive
        pushd "$install_dir" >/dev/null
        ln -s "$abs_submodule_dir" "$submodule_dir_name"
        popd >/dev/null
    fi
}

function get_abs_filename() {
    local rel_filename="$1"
    echo "$(cd "$(dirname "$rel_filename")" && pwd)/$(basename "$rel_filename")"
}

function install_dotfile() {
    if [[ ! $# -eq 2 ]]; then
        echo "install_dotfile requires dotfile and install_dir to be passed."
        exit 1
    fi

    local dotfile="$1"
    local install_dir="$2"

    mkdir -p "$install_dir"

    if [[ ! -e "$install_dir/$dotfile" ]]; then
        ln -s $(get_abs_filename "$dotfile") "$install_dir/$dotfile"

        if [[ "$dotfile" = ".gitignore_global" ]]; then
            git config --global core.excludesfile ~/.gitignore_global
        fi
    fi
}

# Install oh-my-zsh, if not already installed
if [[ ! -d ~/.oh-my-zsh ]]; then
    sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
    rm ~/.zshrc || true
fi

# Install pyenv
submodule_symlink $(get_abs_filename "./.pyenv") "$HOME"

# Add pyenv stuff to our path now that it's installed, if it's not already there
if ! command -v pyenv; then
	export PATH="$PATH:$HOME/.pyenv/bin"
fi

# Same for pyenv-virtualenv
submodule_symlink $(get_abs_filename "./pyenv-virtualenv") "$(pyenv root)/plugins/"

# And direnv (requires Go)
submodule_symlink $(get_abs_filename "./direnv") "$HOME"
command -v direnv >/dev/null 2>&1 || (cd direnv && make direnv && cd ..)

# Setup dotfiles
for dotfile in .gitignore_global .spacemacs .p10k.zsh \
                                 .pylintrc .ipyrc .zshrc \
                                 .zshenv flake8; do
    install_dir="$HOME"

    if [[ "$dotfile" = "flake8" ]]; then
        install_dir="$HOME/.config"
    fi

    install_dotfile "$dotfile" "$install_dir"
done

ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"

# Setup zsh plugins
for plugin in $(ls ./zsh_plugins); do
    abs_plugin=$(get_abs_filename "./zsh_plugins/$plugin")
    submodule_symlink "$abs_plugin" "$ZSH_CUSTOM/plugins"
done

# Setup zsh themes
for theme in $(ls ./zsh_themes); do
    abs_theme=$(get_abs_filename "./zsh_themes/$theme")
    submodule_symlink "$abs_theme" "$ZSH_CUSTOM/themes"
done

# Setup custom emacs snippets
for snippet_dir in $(ls ./snippets); do
    abs_snippet_dir=$(get_abs_filename "./snippets/$snippet_dir")
    submodule_symlink "$abs_snippet_dir" "$HOME/.spacemacs.d/snippets"
done;

# Install source code pro font for spacemacs/terminal
if [[ ! -f ~/.fonts/SourceCodePro-BlackIt.otf ]]; then
    mkdir -p ~/.fonts
    wget https://github.com/adobe-fonts/source-code-pro/archive/2.010R-ro/1.030R-it.zip -O ~/.fonts/source-code-pro.zip
    pushd ~/.fonts >/dev/null
    unzip source-code-pro.zip
    rm source-code-pro.zip
    cp source-code-pro-2.010R-ro-1.030R-it/OTF/*.otf .
    rm -r source-code-pro-2.010R-ro-1.030R-it/
    popd > /dev/null
fi
