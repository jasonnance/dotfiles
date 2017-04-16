#!/bin/bash

# Assumes emacs, vim, and zsh are already installed.

set -e

function get_abs_filename() {
    local rel_filename="$1"
    echo "$(cd "$(dirname "$rel_filename")" && pwd)/$(basename "$rel_filename")"
}

# Install oh-my-zsh, if not already installed
if [[ ! -d ~/.oh-my-zsh ]]; then
    sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
    rm ~/.zshrc
fi

# Setup dotfiles
for dotfile in .gitignore_global .gvimrc .vimrc .spacemacs .vim .ipyrc .zshrc; do
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

# Setup custom emacs snippets
base_snippet_dir="$HOME/.spacemacs.d/snippets"
mkdir -p "$base_snippet_dir"
pushd snippets > /dev/null
for snippet_dir in $(ls .); do
    abs_snippet_dir=$(get_abs_filename "$snippet_dir")
    pushd "$base_snippet_dir" > /dev/null
    if [[ ! -L "$snippet_dir" ]]; then
        ln -s "$abs_snippet_dir" "$snippet_dir"
    fi
    popd > /dev/null
done;
popd > /dev/null

# Install source code pro font for spacemacs
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
