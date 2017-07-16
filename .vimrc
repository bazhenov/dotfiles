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
set relativenumber
set nofoldenable

" Allowing to switch from unsaved buffer
set hidden

" Disabling word wrapping
set linebreak 
set wrap

let mapleader='\'
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

if &term =~# '^screen'
	let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
	let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

syntax enable
set termguicolors
colorscheme srcery-drk

nmap <Leader>t :TlistToggle<CR>

nmap <Leader>m :make<CR>
nmap <C-h> <C-W>h
nmap <C-j> <C-W>j
nmap <C-k> <C-W>k
nmap <C-l> <C-W>l
nmap <C-n> :nohlsearch<CR>
nmap <F8> :TagbarToggle<CR>

nmap <Tab> :bnext<CR>
nmap <S-Tab> :bprevious<CR>

set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0

set scrolloff=3

set nocompatible              " be iMproved, required
filetype off                  " required

call vundle#begin()
Plugin 'Vundle.vim'
filetype plugin indent on    " required

let buftabline_indicators=1

let g:ctrlp_custom_ignore = '\v([\/]node_modules|DS_Store|\.git|target|vendor[\/])|(\.class$)'
