set nocompatible	" be iMproved, required
filetype off		" required

" set the runtime path to include Vundle and intialize
call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tomasr/molokai'
"Plug 'flazz/vim-colorschemes'

Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

Plug 'tpope/vim-markdown'
Plug 'klen/python-mode'
Plug 'nvie/vim-flake8'
Plug 'artur-shaik/vim-javacomplete2'
Plug 'ervandew/supertab'
Plug 'mbbill/undotree'
Plug 'dhruvasagar/vim-table-mode'
Plug 'scrooloose/nerdtree'			" file tree browser
Plug 'scrooloose/nerdcommenter'		" commenting tool
Plug 'kien/ctrlp.vim' 			" this is CtrlP!
Plug 'tpope/vim-surround'                     " change surrounding marks

call plug#end()		" required
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
set shell=/bin/bash
set clipboard=unnamedplus

" remap leader key
let mapleader="\<Space>"

" Save, Quit, Source
nnoremap <Leader>w :w<CR>
nnoremap <Leader>x :x<CR>
nnoremap <Leader>q :q!<CR>
nnoremap <Leader>s :source %<CR>

" Navigate splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Autoexpansion of parens, brackets etc.
inoremap (<CR> (<CR>)<Esc>O
inoremap {<CR> {<CR>}<Esc>O
inoremap {; {<CR>};<Esc>O
inoremap {, {<CR>},<Esc>O
inoremap [<CR> [<CR>]<Esc>O
inoremap [; [<CR>];<Esc>O
inoremap [, [<CR>],<Esc>O

" Toggle Undo Tree
nnoremap <F5> :UndotreeToggle<CR>

" Persistent undo
if has("persistent_undo")
  set undodir=~/.undodir/
  set undofile
endif

" copy & paste with <Space>p and <Space>y
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" NERDTree mapping
nmap <Leader>t :NERDTree<CR>

" table mode shortcut
nmap <Leader>tm :TableModeToggle<CR>
" table mode uses markdown style for separators
let g:table_mode_corner="|"

" capitalize the previous word
nmap <Leader>\ m`b~``

" prettier fonts and shapes on airline status bar
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" Ultisnips shortcuts
let g:UltiSnipsSnippetsDir = $HOME.'/.vim/plugged/vim-snippets/UltiSnips/'
let g:UltiSnipsSnippetDirectories=["UltiSnips"]
let g:UltiSnipsExpandTrigger = '<C-Space>'
let g:UltiSnipsListSnippets = '<C-l>'
let g:UltiSnipsEditSplit="vertical"

" fugitive on the statusline - if the plugin is loaded
set statusline+=%{exists('g:loaded_fugitive')?fugitive#statusline():''}

" this fixed some silly error a long time ago...I think...
set guicursor=

" build and run java
autocmd FileType java set makeprg=javac\ %
autocmd FileType java set errorformat=%A%f:%l:\ %m,%-Z%p^,%-C%.%#
autocmd FileType java map <Leader>j :make<Return>:copen<Return>

" pymode shortcuts/settings
autocmd FileType python let g:pymode_run_bind = '<Leader>r'
let g:pymode_lint = 1
let g:pymode_lint_unmodified = 0
let g:pymode_lint_message = 1
let g:pymode_lint_checkers = ['pyflakes', 'pep8', 'mccabe']

" colorscheme
set background=dark
colorscheme molokai
