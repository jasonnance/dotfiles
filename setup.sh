#!/bin/bash

set -e

for dotfile in .gitignore_global .gvimrc .vimrc .spacemacs .vim; do
    if [[ ! -e "$dotfile" ]]; then
        ln -s "../$dotfile" $dotfile
    fi
done
