# Dotfiles

.vimrc, .gvimrc, pathogen plugins, skins, .spacemacs... and probably more stuff, eventually.

## Setup

    ./setup.sh

## Misc

- On OS X, don't forget to rename `/etc/zprofile` to `/etc/zshenv` to prevent it from screwing up your PATH (`/etc/zprofile` resets the path and is called after `~/.zshenv`); [see here](https://emacs.stackexchange.com/questions/30397/package-exec-path-from-shell-isnt-setting-path-variables-from-zshenv-on-ma#comment46856_30397)
