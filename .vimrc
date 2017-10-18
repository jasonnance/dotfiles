runtime bundle/vim-pathogen/autoload/pathogen.vim

execute pathogen#infect()

set shell=/bin/bash

set shiftwidth=4
set tabstop=4
set expandtab
set smarttab        
set softtabstop=4   " treat 4 spaces as a tab
set number          " line numbers
set backspace=indent,eol,start   "backspaces delete these things
set foldmethod=indent
set foldlevel=99
set fileformats=unix,dos,mac

syntax enable
filetype on
filetype plugin on
filetype plugin indent on
autocmd FileType html.mustache,scss,css,html setlocal shiftwidth=2 softtabstop=2

set omnifunc=syntaxcomplete#Complete

map <silent><A-Right> :tabnext<CR>
map <silent><A-Left> :tabprevious<CR> 
