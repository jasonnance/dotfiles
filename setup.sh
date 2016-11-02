#!/bin/bash

set -e

for dotfile in .gitignore_global .gvimrc .vimrc .spacemacs .vim .ipyrc; do
    if [[ ! -e "../$dotfile" ]]; then
        ln -s $(readlink -f $dotfile) "$HOME/$dotfile"

        if [[ "$dotfile" = ".vim" ]]; then
            cd "$dotfile"
            git submodule update --init --recursive
        fi
    fi
done
