#!/bin/bash

set -e

function get_abs_filename() {
    local rel_filename="$1"
    echo "$(cd "$(dirname "$rel_filename")" && pwd)/$(basename "$rel_filename")"
}

for dotfile in .gitignore_global .gvimrc .vimrc .spacemacs .vim .ipyrc; do
    if [[ ! -e "../$dotfile" ]]; then
        ln -s $(get_abs_filename "$dotfile") "$HOME/$dotfile"

        if [[ "$dotfile" = ".vim" ]]; then
            cd "$dotfile"
            git submodule update --init --recursive
        fi
    fi
done
