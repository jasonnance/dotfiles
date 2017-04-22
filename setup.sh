#!/bin/bash

# Assumes emacs/spacemacs, vim, and zsh are already installed.

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
    if [[ ! -L "$install_dir/$submodule_dir_name" ]]; then
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

# Install oh-my-zsh, if not already installed
if [[ ! -d ~/.oh-my-zsh ]]; then
    sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
    rm ~/.zshrc
fi

# Install pyenv
submodule_symlink $(get_abs_filename "./.pyenv") "$HOME"

# Same for pyenv-virtualenv
submodule_symlink $(get_abs_filename "./pyenv-virtualenv") "$(pyenv root)/plugins/"

# Setup dotfiles
for dotfile in .gitignore_global .gvimrc .vimrc .spacemacs .vim .ipyrc .zshrc .zshenv; do
    if [[ ! -e "../$dotfile" ]]; then
        ln -s $(get_abs_filename "$dotfile") "$HOME/$dotfile"

        if [[ "$dotfile" = ".vim" ]]; then
            pushd "$dotfile"
            git submodule update --init --recursive
            popd
        elif [[ "$dotfile" = ".gitignore_global" ]]; then
            git config --global core.excludesfile ~/.gitignore_global
        fi
    fi
done

ZSH_CUSTOM="/home/jason/.oh-my-zsh/custom"

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
