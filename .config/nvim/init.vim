set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'mileszs/ack.vim'
Plugin 'tpope/vim-surround'
Plugin 'mkitt/tabline.vim'
Plugin 'ap/vim-buftabline'
Plugin 'milkypostman/vim-togglelist'
Plugin 'flazz/vim-colorschemes'
Plugin 'itchyny/lightline.vim'
Plugin 'airblade/vim-rooter'
Plugin 'w0rp/ale'
Plugin 'machakann/vim-highlightedyank'
Plugin 'autozimu/LanguageClient-neovim'
call vundle#end()
filetype plugin indent on    " required

set number
set relativenumber
set autoindent
set tabstop=2
set fileformat=unix
set noexpandtab
set shiftwidth=2

set incsearch
set hlsearch

set showmatch
set wildmenu
set nofoldenable

" Allowing to switch from unsaved buffer
set hidden

language en_US.UTF-8
set encoding=utf-8

" Disabling word wrapping
set linebreak 
set wrap

" Setting space as a leader
nnoremap <SPACE> <Nop>
let mapleader=' '

" включаем режим внутристрочной навигации
imap <silent> <Down> <C-o>gj
imap <silent> <Up> <C-o>gk
nmap <silent> <Down> gj
nmap <silent> <Up> gk

" disable arrow navigations
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

cmap w!! w !sudo tee % >/dev/null

if &term =~# '^screen'
	let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
	let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

syntax enable
set termguicolors
colorscheme CandyPaper

language en_US.UTF-8
nmap <Leader>m :!make<CR>
nmap <Leader>t :!make test<CR>
nmap <C-h> <C-W>h
nmap <C-j> <C-W>j
nmap <C-k> <C-W>k
nmap <C-l> <C-W>l
nmap <C-n> :nohlsearch<CR>

nmap <F5> :so $MYVIMRC<CR>

nmap <Tab> :bnext<CR>
nmap <S-Tab> :bprevious<CR>

set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0

set scrolloff=3

let buftabline_indicators=1

let g:ctrlp_custom_ignore = '\v([\/]node_modules|DS_Store|\.git|target|vendor[\/])|(\.class$)'

if executable('ag')
	let g:ackprg = 'ag --vimgrep'
endif

autocmd FileType rust setlocal shiftwidth=2 tabstop=2 noexpandtab

set secure
set exrc

let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'stable', 'rls'],
    \ }

" Automatically start language servers.
let g:LanguageClient_autoStart = 1

nmap <leader>w :bd<cr>

nnoremap <silent> <leader>lh :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> <leader>ld :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <leader>lr :call LanguageClient_textDocument_references()<CR>
nnoremap <silent> <leader>lR :call LanguageClient_textDocument_rename()<CR>
nnoremap <silent> <leader>ls :call LanguageClient_textDocument_documentSymbol()<CR>
