syntax on
set background=dark
colorscheme solarized

" Nicer searching
set incsearch               " Incremental searching
set hlsearch                " Highlight matches
set showmatch               " Show match numbers
set ignorecase              " Search case-insensitive
set smartcase               " ...except when something is capitalized
set nospell
set smartindent

"execute "set colorcolumn=" . join(range(81,335), ',')
highlight ColorColumn ctermbg=Yellow

"set textwidth=82
set colorcolumn=-1

" Whitespace handling
set tabstop=8
set shiftwidth=4
set expandtab               " Use spaces, not tabs
set backspace=indent,eol,start " Backspace through everything

" Indentation
set autoindent
set smartindent

set number                  " Line numbering"
set relativenumber

set wildmenu " Wildmode, some command completion
set wildmode=list:longest,full

set mouse=a " Enable mouse support - even in tmux \o/

" {}()[] :)
"inoremap { {}<left>
"inoremap ( ()<left>
"inoremap [ []<left>
"
"inoremap ' ''<left>
"inoremap " ""<left>
"
inoremap < <><left>
"inoremap ` ``<left>

" cool resizing
nnoremap <Left> :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>
nnoremap <Up> :resize -2<CR>
nnoremap <Down> :resize +2<CR><Paste>

" block comments
iab /** /**<CR><BS>/<Up>

set rtp^=/usr/share/vim/vimfiles/

" nerdtree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif""))
map <C-t> :NERDTreeToggle<CR>>

" show hidden files by default
let NERDTreeShowHidden=1

" j/k for multilines
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" toggle hlsearch
nnoremap <F3> :set hlsearch!<CR>
nnoremap <F4> :set nopaste<CR>

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

" makefile needs tabs
:autocmd FileType make set noexpandtab

" Split (unjoin) lines
nnoremap K i<CR><ESC>

set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

" some menu tabbing stuff
set completeopt=longest,menuone
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'


call plug#begin('~/.vim/vim-plug-plugins')
    Plug 'editorconfig/editorconfig-vim'
    Plug 'jiangmiao/auto-pairs'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-surround'
    Plug 'ajh17/VimCompletesMe'
call plug#end()
