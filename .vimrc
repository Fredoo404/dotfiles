" Enable syntax color
syntax on

" Use UTF-8 without BOM
set encoding=utf-8 nobomb

" Change mapleader
let mapleader=","

" Mouse support
set mouse=a

" Don’t add empty newlines at the end of files
set binary
set noeol

"Replace tab with spaces
set expandtab

"Number of space characters that will be inserted when the tab key is pressed
set tabstop=4

"Change the number of space characters inserted for indentation
set shiftwidth=4

"Makes the spaces feel like real tabs
set softtabstop=4

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
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-fugitive'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic' " Don't forget to install shellsheck fo shell verification.
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-notes'
Plugin 'dominikduda/vim_current_word'

" All of Plugins must be added before the following line
call vundle#end()
filetype plugin indent on

" vim notes configuration
let g:notes_directories = ['~/Dropbox/notes']

" Set badwolf colorscheme
colorscheme badwolf

" Airline conf
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" Mapping
map <Leader>n :NERDTreeToggle<cr>
nnoremap <Leader>p :set invpaste paste?<CR>
set pastetoggle=<Leader>p
nmap <leader>l :set list!<CR>
set listchars=tab:▸\ ,eol:¬\,space:␣

" Tmux conf
let g:tmuxline_preset = {
      \'a'    : '#S',
      \'win'  : ['#I', '#W'],
      \'cwin' : ['#I', '#W'],
      \'y'    : ['%R', '%a', '%Y'],
      \'z'    : '#H'}

" CtrlP config
let g:ctrlp_cmd = 'CtrlPBuffer'
