set nocompatible	" be iMproved, required
filetype off		" required

" set the runtime path to include Vundle and intialize
call plug#begin('~/.vim/plugged')

" Theme/color
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'dracula/vim'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Functionality
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-surround'
Plug 'ervandew/supertab'
Plug 'mbbill/undotree'

" Python
Plug 'klen/python-mode'
Plug 'nvie/vim-flake8'

" Markdown
Plug 'tpope/vim-markdown'
Plug 'dhruvasagar/vim-table-mode'

" Rust
Plug 'racer-rust/vim-racer'

" Powershell
Plug 'pprovost/vim-ps1'

" Task Warrior
Plug 'blindFS/vim-taskwarrior'
Plug 'preservim/tagbar'
Plug 'powerman/vim-plugin-AnsiEsc'

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

" fugitive on the statusline - if the plugin is loaded
set statusline+=%{exists('g:loaded_fugitive')?fugitive#statusline():''}

" this fixed some silly error a long time ago...I think...
set guicursor=

" build and run java
"autocmd FileType java set makeprg=javac\ %
"autocmd FileType java set errorformat=%A%f:%l:\ %m,%-Z%p^,%-C%.%#
"autocmd FileType java map <Leader>j :make<Return>:copen<Return>

" pymode shortcuts/settings
autocmd FileType python let g:pymode_run_bind = '<Leader>r'
let g:pymode_lint = 1
let g:pymode_lint_unmodified = 0
let g:pymode_lint_message = 1
let g:pymode_lint_checkers = ['black', 'pyflakes', 'pep8', 'mccabe']

" spellcheck on txt and markdown
autocmd FileType markdown setlocal spell
autocmd FileType text setlocal spell

" colorscheme
set background=dark
colorscheme dracula
