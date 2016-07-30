set nocompatible	" be iMproved, required
filetype off		" required

call plug#begin('/home/user/.vim/autoload/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'altercation/vim-colors-solarized'

Plug 'scrooloose/syntastic'
Plug 'tpope/vim-fugitive'			" github interface
Plug 'airblade/vim-gitgutter'		        " show git diff in gutter
Plug 'klen/python-mode'
"Plugin 'vim-ruby/vim-ruby'			" ruby tool
"Plugin 'fatih/vim-go'				" go-lang tool
"Plugin 'elzr/vim-json'  			" JSON highlighting tool
"Plugin 'pangloss/vim-javascript'		" js tool
"Plugin 'tpope/vim-cucumber'			" cucumber script helper
"Plugin 'moll/vim-node'

Plug 'mbbill/undotree'
"Plug 'dhruvasagar/vim-table-mode'
Plug 'scrooloose/nerdtree'			" file tree browser
Plug 'scrooloose/nerdcommenter'		" commenting tool
Plug 'kien/ctrlp.vim' 			" this is CtrlP!

Plug 'SirVer/ultisnips'			" snipping tool - python based
Plug 'honza/vim-snippets'
Plug 'tpope/vim-surround'                     " change surrounding marks

call plug#end()

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

" capitalize the previous word
nmap <Leader>\ m`b~``

" prettier fonts and shapes on airline status bar
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

let g:UltiSnipsSnippetsDir = $HOME.'/.vim/UltiSnips/'
let g:UltiSnipsSnippetDirectories=["UltiSnips"]
let g:UltiSnipsExpandTrigger = '<C-Space>'
let g:UltiSnipsListSnippets = '<C-l>'
let g:UltiSnipsEditSplit="vertical"

" fugitive on the statusline - if the plugin is loaded
set statusline+=%{exists('g:loaded_fugitive')?fugitive#statusline():''}

" syntastic on the the statusline
let g:airline#extensions#syntastic#enabled = 1

" table mode uses markdown style for separators
let g:table_mode_corner="|"

" colorscheme
set background=dark
set t_Co=16
colorscheme solarized
