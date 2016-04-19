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
Plugin 'edkolev/tmuxline.vim'                   " this may not be needed
Plugin 'altercation/vim-colors-solarized'

Plugin 'tpope/vim-fugitive'			" github interface
Plugin 'airblade/vim-gitgutter'		        " show git diff in gutter

Plugin 'vim-ruby/vim-ruby'			" ruby tool
Plugin 'fatih/vim-go'				" go-lang tool
Plugin 'elzr/vim-json'  			" JSON highlighting tool
Plugin 'pangloss/vim-javascript'		" js tool
Plugin 'tpope/vim-cucumber'			" cucumber script helper
Plugin 'moll/vim-node'

Plugin 'scrooloose/nerdtree'			" file tree browser
Plugin 'scrooloose/nerdcommenter'		" commenting tool
Plugin 'kien/ctrlp.vim' 			" this is CtrlP!

Plugin 'Valloric/YouCompleteMe'                 " code-completion
Plugin 'SirVer/ultisnips'			" snipping tool - python based
Plugin 'honza/vim-snippets'
Plugin 'tpope/vim-surround'                     " change surrounding marks

call vundle#end()		" required
filetype plugin indent on	" required

syntax enable
set laststatus=2
set number
set expandtab
set shiftwidth=2
set softtabstop=2
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
nnoremap <Leader>q :q!<CR>
nnoremap <Leader>s :source %<CR>

" copy & paste with <Space>p and <Space>y
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" You Complete Me restart server mapping
nmap <Leader>yr :YcmRestartServer<CR>

" NERDTree mapping
nmap <Leader>t :NERDTree<CR>

" forced use of python2 interpreter - python3 not compatible
let g:ycm_server_python_interpreter = '/usr/bin/python'

" prettier fonts and shapes on airline status bar
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" set to something that shouldn't be used while typeing
let g:ycm_key_list_previous_completions=['<Up>']

let g:UltiSnipsSnippetsDir = $HOME.'/.vim/UltiSnips/'
let g:UltiSnipsSnippetDirectories=["UltiSnips"]
let g:UltiSnipsExpandTrigger = '<C-Space>'
let g:UltiSnipsListSnippets = '<C-l>'
let g:UltiSnipsEditSplit="vertical"

" colorscheme
set background=dark
colorscheme solarized
let g:solarized_termcolors=16
let g:solarized_termtrans=1
set t_Co=16
