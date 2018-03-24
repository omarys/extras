set nocompatible	" be iMproved, required
filetype off		" required

" set the runtime path to include Vundle and intialize
call plug#begin('/home/omary/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'flazz/vim-colorschemes'

Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

Plug 'tpope/vim-markdown'
Plug 'klen/python-mode'
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

" You Complete Me restart server mapping
" nmap <Leader>yr :YcmRestartServer<CR>

" NERDTree mapping
nmap <Leader>t :NERDTree<CR>

" table mode shortcut
nmap <Leader>tm :TableModeToggle<CR>

" capitalize the previous word
nmap <Leader>\ m`b~``

" forced use of python2 interpreter - python3 not compatible
" let g:ycm_server_python_interpreter = '/usr/bin/python'

" prettier fonts and shapes on airline status bar
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" set to something that shouldn't be used while typeing
" let g:ycm_key_list_previous_completions=['<Up>']

let g:UltiSnipsSnippetsDir = $HOME.'/.vim/plugged/vim-snippets/UltiSnips/'
let g:UltiSnipsSnippetDirectories=["UltiSnips"]
"let g:UltiSnipsExpandTrigger = '<C-Space>'
let g:UltiSnipsListSnippets = '<C-l>'
let g:UltiSnipsEditSplit="vertical"

" fugitive on the statusline - if the plugin is loaded
set statusline+=%{exists('g:loaded_fugitive')?fugitive#statusline():''}

" table mode uses markdown style for separators
let g:table_mode_corner="|"

set guicursor=

" colorscheme
set background=dark
colorscheme molokai
let g:solarized_termcolors=16
let g:solarized_termtrans=1
set t_Co=16
