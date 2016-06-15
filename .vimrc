syntax on

" Nicer searching
set incsearch               " Incremental searching
set hlsearch                " Highlight matches
set showmatch               " Show match numbers
set ignorecase              " Search case-insensitive
set smartcase               " ...except when something is capitalized

execute "set colorcolumn=" . join(range(81,335), ',')
highlight ColorColumn ctermbg=Black

" Whitespace handling
set tabstop=8
set shiftwidth=4
set expandtab               " Use spaces, not tabs
set backspace=indent,eol,start " Backspace through everything

" Indentation
set autoindent

set number                  " Line numbering"
set relativenumber

set wildmenu " Wildmode, some command completion
set wildmode=list:longest,full

set mouse=a " Enable mouse support - even in tmux \o/

" {}()[] :)
inoremap { {}<left>
inoremap ( ()<left>
inoremap [ []<left>

inoremap ' ''<left>
inoremap " ""<left>

inoremap < <><left>
inoremap ` ``<left>

set rtp^=/usr/share/vim/vimfiles/

" nerdtree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif""))
map <C-t> :NERDTreeToggle<CR>>

" show hidden files by default
let NERDTreeShowHidden=1

noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" toggle hlsearch
nnoremap <F3> :set hlsearch!<CR>

" Switch leader key to `<Space>`
let mapleader = "\<Space>"

" comments ctrl+/, adds // at the beginning of a line
nnoremap <Leader>/ :s#^//\{1}\\|^#//#<CR> :set nohlsearch<CR>
vnoremap <Leader>/ :s#^//\{1}\\|^#//#<CR> :set nohlsearch<CR>
nnoremap <Leader>. :s#^//##<CR> :set nohlsearch<CR>
vnoremap <Leader>. :s#^//##<CR> :set nohlsearch<CR>

" filetype plugin on for specific file mappings
filetype plugin on

" Highlight current line
set cursorline

" Deactivate swap file creation
set noswapfile
