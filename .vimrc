" Enable syntax color
syntax on

"Ignore the case during search
set ignorecase
set smartcase

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

" Tags 
set tags^=./tags,.git/tags;
set tagrelative

function CreateTags()
    exec ':!ctags -R --tag-relative -f ' . '.git/tags app/'
endfunction
nmap <silent> <F4> :call CreateTags()<CR>

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
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic' " Don't forget to install shellsheck fo shell verification.
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-notes'
Plugin 'dominikduda/vim_current_word'
Plugin 'edkolev/tmuxline.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'majutsushi/tagbar'

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
set listchars=tab:▸\ ,eol:¬\,nbsp:␣,trail:•,space:·
nmap <leader>gt :GitGutterToggle<CR>
nmap <leader>gst :GitGutterSignsToggle<CR>
nmap <leader>ght :GitGutterLineHighlightsToggle<CR>
nmap <leader>ghn :GitGutterNextHunk<CR>
nmap <leader>ghp :GitGutterPrevHunk<CR>
nmap <leader>gha <Plug>GitGutterStageHunk<CR>
nnoremap <leader>p li<space><esc>p
nnoremap <silent> <Leader>b :TagbarToggle<CR>

" Tmux conf
let g:tmuxline_preset = {
      \'a'    : '#S',
      \'win'  : ['#I', '#W'],
      \'cwin' : ['#I', '#W'],
      \'y'    : ['%R', '%a', '%Y'],
      \'z'    : '#H'}

" CtrlP config
let g:ctrlp_cmd = 'CtrlPBuffer'
let g:ctrlp_cmd = 'CtrlPTag'

" GitGutter config
highlight GitGutterAdd    guifg=#009900 guibg=1 ctermfg=2 ctermbg=0
highlight GitGutterChange guifg=#bbbb00 guibg=1 ctermfg=3 ctermbg=0
highlight GitGutterDelete guifg=#ff2222 guibg=1 ctermfg=1 ctermbg=0
set updatetime=100

" Enable autoread file when change occured from disk
set autoread

" Command auto
autocmd BufWritePost *.php execute '!vendor/bin/php-cs-fixer fix %'
