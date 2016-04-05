set nocompatible	" be iMproved, required
filetype off		" required

" set the runtime path to include Vundle and intialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'edkolev/tmuxline.vim'
Plugin 'altercation/vim-colors-solarized'

Plugin 'tpope/vim-fugitive'			" github interface
Plugin 'airblade/vim-gitgutter'		        " show git diff in gutter

Plugin 'vim-ruby/vim-ruby'			" ruby tool
Plugin 'fatih/vim-go'				" go-lang tool
Plugin 'elzr/vim-json'  			" JSON highlighting tool
Plugin 'pangloss/vim-javascript'		" js tool
Plugin 'tpope/vim-cucumber'			" cucumber script helper

Plugin 'scrooloose/nerdtree'			" file tree browser
Plugin 'scrooloose/nerdcommenter'		" commenting tool
Plugin 'kien/ctrlp.vim' 			" this is CtrlP!
Plugin 'SirVer/ultisnips'			" snipping tool - python based
Plugin 'tpope/vim-surround'
Plugin 'terryma/vim-expand-region'

" Requires compile
Plugin 'Valloric/YouCompleteMe'                 " code-completion

" All Plugins declared above.
call vundle#end()		" required
filetype plugin indent on	" required
" To ignore plugin indent changes, instead use:
" filetype plugin on
"
" Brief help
" :PluginList	- lists configured plugins
" :PluginInstall	 - installs plugins: append '!' to update or just use
" :PluginUpdate
" :PluginSearch foo	- searches for foo; append '!' to refresh local cache
" :PluginClean		- confirms removal of unused plugins; append '!' to
" 			  auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
set laststatus=2
set number
set expandtab
set shiftwidth=4
set softtabstop=4
set smarttab
set noshowmode
set timeoutlen=250
set ignorecase
set hlsearch
set incsearch
set showmatch
set shell=/usr/bin/bash
set clipboard=unnamedplus

" remap leader key
let mapleader="\<Space>"

" Save, Quit, Source
nnoremap <Leader>w :w<CR>
nnoremap <Leader>x :x<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>s :source %<CR>

" copy & paste with <Space>p and <Space>y
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" NERDTree mapping
nmap <Leader>t :NERDTree<CR>
" NERDComment toggle
nmap <Leader>c :call NERDComment(0, "toggle")<CR>

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

syntax enable
set background=dark
colorscheme solarized
let g:solarized_termcolors=16
let g:solarized_termtrans=1
set t_Co=16
