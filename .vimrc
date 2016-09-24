set nocp
set number
set autoindent
set tabstop=2
set fileformat=unix
set noexpandtab
set shiftwidth=2
set incsearch
set hlsearch
set showmatch
set wildmenu
let mapleader='\'

" отключаем переносы строк по словам
set linebreak 
set wrap

" включаем режим внутристрочной навигации
imap <silent> <Down> <C-o>gj
imap <silent> <Up> <C-o>gk
nmap <silent> <Down> gj
nmap <silent> <Up> gk

cmap w!! w !sudo tee % >/dev/null

" Pathogen activation
filetype off

call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

filetype plugin indent on

syntax enable
colorscheme slate

nmap <Leader>t :TlistToggle<CR>

nmap <Leader>p :!phpunit<CR>
nmap <C-h> <C-W>h
nmap <C-j> <C-W>j
nmap <C-k> <C-W>k
nmap <C-l> <C-W>l

set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
highlight lCursor guifg=NONE guibg=Cyan

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
"set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" " alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')
"
" " let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'fugititive.vim'
Plugin 'ctrlp.vim'
Plugin 'vim-airline/vim-airline'

" " All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" " To ignore plugin indent changes, instead use:
" "filetype plugin on
" "
" " Brief help
" " :PluginList       - lists configured plugins
" " :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" " :PluginSearch foo - searches for foo; append `!` to refresh local cache
" " :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
" "
" " see :h vundle for more details or wiki for FAQ
" " Put your non-Plugin stuff after this line
"
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

nmap <C-]> :bnext<CR>
nmap <C-[> :bprevious<CR>
