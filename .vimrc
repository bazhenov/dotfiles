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

map <F3> :set relativenumber!<CR>

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

nmap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0

highlight lCursor guifg=NONE guibg=Cyan

set nocompatible              " be iMproved, required
filetype off                  " required

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'fugititive.vim'
Plugin 'ctrlp.vim'
Plugin 'vim-airline/vim-airline'
filetype plugin indent on    " required

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
