#!/bin/bash

set -e

function get_abs_filename() {
    local rel_filename="$1"
    echo "$(cd "$(dirname "$rel_filename")" && pwd)/$(basename "$rel_filename")"
}

# Setup dotfiles
for dotfile in .gitignore_global .gvimrc .vimrc .spacemacs .vim .ipyrc; do
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
    ln -s "$abs_snippet_dir" "$snippet_dir"
    popd > /dev/null
done;
popd > /dev/null
