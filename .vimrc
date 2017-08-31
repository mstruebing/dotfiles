syntax on
set background=dark
colorscheme torte

" Nicer searching
set incsearch               " Incremental searching
set hlsearch                " Highlight matches
set showmatch               " Show match numbers
set ignorecase              " Search case-insensitive
set smartcase               " ...except when something is capitalized
set nospell
set noshowmode

set clipboard=unnamedplus

" reload file if changed on disk
set autoread
au CursorHold * checktime  

" Open new split panes to right and bottom, which feels more natural than Vim’s default
set splitbelow
set splitright

" We can use different key mappings for easy navigation between splits to save a keystroke. So instead of ctrl-w then j, it’s just ctrl-j
" nnoremap <C-j> <C-W><J>
" nnoremap <C-k> <C-W><K>
" nnoremap <C-l> <C-W><L>
" nnoremap <C-h> <C-W><H>

" Whitespace handling
set tabstop=8
set shiftwidth=4
set expandtab               " Use spaces, not tabs
set backspace=indent,eol,start " Backspace through everything

" Indentation
set autoindent
set smartindent

set number                  " Line numbering
set relativenumber

set wildmenu " Wildmode, some command completion
set wildmode=list:longest,full

set mouse=a " Enable mouse support - even in tmux \o/

" cool resizing
nnoremap <Left> :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>
nnoremap <Up> :resize -2<CR>
nnoremap <Down> :resize +2<CR>

map <F11> :w<CR>:VimuxPromptCommand<CR>
map <F12> :w<CR>:VimuxRunLastCommand<CR>
inoremap <F11> <ESC>:w<CR>:VimuxPromptCommand<CR>
inoremap <F12> <ESC>:w<CR>:VimuxRunLastCommand<CR>

set rtp^=/usr/share/vim/vimfiles/

" nerdtree
autocmd StdinReadPre * let s:std_in=1
" enter nerdtree on start
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif""))
map <C-t> :NERDTreeToggle<CR>

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

" spell for md
autocmd BufRead,BufNewFile *.md setlocal spell spelllang=en_us

" Split (unjoin) lines
nnoremap K i<CR><ESC>

" some menu tabbing stuff
set completeopt=longest,menuone

" some git maps
map <leader>gs :Gstatus<CR>
map <leader>gc :Gcommit<CR>
map <leader>gb :Gblame<CR>
map <leader>gl :Glog<CR>

map <leader>f :FZF<CR>
map <leader>a :Ag 
map <leader>w :Windows<CR> 

" Move to line
map <Leader>l <Plug>(easymotion-bd-jk)
nmap <Leader>l <Plug>(easymotion-overwin-line)

imap <c-x><c-l> <plug>(fzf-complete-line)


" lightline theme
let g:lightline = {
      \ 'colorscheme': 'seoul256',
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

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'

" use ag
let $FZF_DEFAULT_COMMAND = 'ag --hidden -g ""'

syntax on
" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" gives nerdtree the same state in every tab
" fucks up the git diff buffer from vim-fugitive
" autocmd BufWinEnter * NERDTreeMirror

" deoplete config
let g:deoplete#enable_at_startup = 1
inoremap <silent><expr><TAB> deoplete#mappings#manual_complete()
" UltiSnips config
inoremap <silent><expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
let g:UltiSnipsExpandTrigger = "<nop>"
inoremap <expr> <CR> pumvisible() ? "<C-R>=UltiSnips#ExpandSnippetOrJump()<CR>" : "\<CR>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"


let g:polyglot_disabled = ['elm']
let g:elm_syntastic_show_warnings = 1

call plug#begin('~/.vim/vim-plug-plugins')
    Plug 'editorconfig/editorconfig-vim'
    Plug 'jiangmiao/auto-pairs'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-surround'
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'vim-syntastic/syntastic'
    Plug 'scrooloose/nerdtree'
    Plug 'tpope/vim-commentary'
    Plug 'itchyny/lightline.vim'
    Plug 'benmills/vimux'
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'
    Plug 'mattn/emmet-vim'
    Plug 'sheerun/vim-polyglot'
    Plug 'christoomey/vim-tmux-navigator'

    Plug 'eagletmt/neco-ghc'
    Plug 'padawan-php/deoplete-padawan', { 'do': 'composer install' }
    Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
    Plug 'zchee/deoplete-go', { 'do': 'make'}

    Plug 'vim-scripts/ScrollColors'
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
    Plug 'airblade/vim-gitgutter'

    Plug 'elmcast/elm-vim'
    Plug 'easymotion/vim-easymotion'
    Plug 'nsf/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }
call plug#end()

hi Normal guibg=NONE ctermbg=NONE
