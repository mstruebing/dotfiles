syntax on

" Nicer searching
set incsearch               " Incremental searching
set hlsearch                " Highlight matches
set showmatch               " Show match numbers
set ignorecase              " Search case-insensitive
set smartcase               " ...except when something is capitalized

" Whitespace handling
set tabstop=2 shiftwidth=2  " Tab is two spaces
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
map <C-n> :NERDTreeToggle<CR>>>

" show hidden files by default
let NERDTreeShowHidden=1

noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" toggle hlsearch
nnoremap <F3> :set hlsearch!<CR>
