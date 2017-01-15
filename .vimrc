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

" Whitespace handling
set tabstop=8
set shiftwidth=4
set expandtab               " Use spaces, not tabs
set backspace=indent,eol,start " Backspace through everything

" Indentation
set autoindent
set smartindent
" filetype indent on

set number                  " Line numbering
set relativenumber

set wildmenu " Wildmode, some command completion
set wildmode=list:longest,full

set mouse=a " Enable mouse support - even in tmux \o/

inoremap < <><left>

" cool resizing
nnoremap <Left> :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>
nnoremap <Up> :resize -2<CR>
nnoremap <Down> :resize +2<CR><Paste>

nnoremap <F11> :VimuxPromptCommand<CR>
nnoremap <F12> :VimuxRunLastCommand<CR>

" block comments
iab /** /**<CR><CR>/<UP>

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

" some menu tabbing stuff
set completeopt=longest,menuone
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

" lightline theme
let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"⭤":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
      \ },
      \ 'separator': { 'left': '|', 'right': '|' },
      \ 'subseparator': { 'left': '|', 'right': '|' }
      \ }

" for syntastic
" create file .syntastic_javac_config
" let g:syntastic_java_javac_classpath = '/home/davis/progs/princeton-algos/week1/libs/algs4.jar'
" see: http://stackoverflow.com/questions/16721322/vim-syntastic-java-unaware-of-current-project-classes
let g:syntastic_java_javac_config_file_enabled = 1

" gives nerdtree the same state in every tab
autocmd BufWinEnter * NERDTreeMirror

call plug#begin('~/.vim/vim-plug-plugins')
    Plug 'editorconfig/editorconfig-vim'
    Plug 'jiangmiao/auto-pairs'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-surround'
    Plug 'ajh17/VimCompletesMe'
    Plug 'vim-syntastic/syntastic'
    Plug 'scrooloose/nerdtree'
    Plug 'tpope/vim-commentary'
    Plug 'itchyny/lightline.vim'
    Plug 'benmills/vimux'
call plug#end()

