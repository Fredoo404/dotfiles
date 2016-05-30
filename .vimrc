" Enable syntax color
syntax on

" Use UTF-8 without BOM
set encoding=utf-8 nobomb

" Change mapleader
let mapleader=","

" Don’t add empty newlines at the end of files
set binary
set noeol

" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
    set undodir=~/.vim/undo
endif

" Required for Bundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Bundle Plugins
Plugin 'VundleVim/Vundle.vim'
Plugin 'saltstack/salt-vim'
Plugin 'sjl/badwolf'

" All of Plugins must be added before the following line
call vundle#end()
filetype plugin indent on

" Set badwolf colorscheme
colorscheme badwolf
