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
set noshowmode

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

map <F11> :w<CR>:VimuxPromptCommand<CR>
map <F12> :w<CR>:VimuxRunLastCommand<CR>
inoremap <F11> <ESC>:w<CR>:VimuxPromptCommand<CR>
inoremap <F12> <ESC>:w<CR>:VimuxRunLastCommand<CR>

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

" use - as 'prefix key' for choosewin
nmap - <Plug>(choosewin)

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
    " editorconfig
    Plug 'editorconfig/editorconfig-vim'
    " () {} []
    Plug 'jiangmiao/auto-pairs'
    " vim plugin
    Plug 'tpope/vim-fugitive'
    " surroundings like '' () and stuff
    Plug 'tpope/vim-surround'
    " complete filenames/code
    Plug 'ajh17/VimCompletesMe'
    " syntax checker
    Plug 'vim-syntastic/syntastic'
    " nerdtree \o/
    Plug 'scrooloose/nerdtree'
    " gcc comment in and out
    Plug 'tpope/vim-commentary'
    " vim statusline - i'm a hipster
    Plug 'itchyny/lightline.vim'
    " easy do a shell command with :VimuxRunCommand
    Plug 'benmills/vimux'
    " switch 'panes' :)
    Plug 't9md/vim-choosewin'
    " emmet :)
    Plug 'mattn/emmet-vim'
call plug#end()

