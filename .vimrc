syntax on
set background=dark
colorscheme torte

" temp fix for relative numbers when a file is opened with fzf as a split or
" new tab
" see https://github.com/junegunn/fzf/issues/930#issuecomment-303212379
au TermOpen * set relativenumber

" Nicer searching
set incsearch               " Incremental searching
set hlsearch                " Highlight matches
set showmatch               " Show matching brackets
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

" Whitespace handling
set tabstop=4
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

autocmd Filetype javascript iabbrev log console.log(<Right>;<Left><Left>

" nerdtree
autocmd StdinReadPre * let s:std_in=1
" enter nerdtree on start
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif""))
map <C-t> :NERDTreeToggle<CR>

" show hidden files by default
let NERDTreeShowHidden=1

" disable ctrl-t mapping
let g:go_def_mapping_enabled = 0

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
map <leader>b :Buffers<CR> 

" Move to line
map <Leader>l <Plug>(easymotion-bd-jk)
nmap <Leader>l <Plug>(easymotion-overwin-line)

imap <c-x><c-l> <plug>(fzf-complete-line)

" ale map 
nnoremap <Leader>n :ALENext<CR>
nnoremap <Leader>N :ALEPrevious<CR>


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

" http://vim.wikia.com/wiki/Go_away_and_come_back
" Creates a session
function! MakeSession()
  let b:sessiondir = $HOME . "/.vim/sessions" . getcwd()
  if (filewritable(b:sessiondir) != 2)
    exe 'silent !mkdir -p ' b:sessiondir
    redraw!
  endif
  let b:sessionfile = b:sessiondir . '/session.vim'
  exe 'mksession! ' . b:sessionfile
endfunction

" Loads a session if it exists
function! LoadSession()
    let b:sessiondir = $HOME . '/.vim/sessions' . getcwd()
    let b:sessionfile = b:sessiondir . '/session.vim'
    if (filereadable(b:sessionfile))
      exe 'source ' b:sessionfile
    else
      echo 'No session loaded.'
    endif
endfunction

augroup sessions
  autocmd!
  if argc() == 0
    au VimEnter * nested :call LoadSession()
    au VimLeave * :call MakeSession()
  endif
augroup END

call plug#begin('~/.vim/vim-plug-plugins')
    """""""""""""""""""""""""""""""
    " Language Plugins
    """""""""""""""""""""""""""""""

    " elm plugin
    Plug 'elmcast/elm-vim'

    " go plugin
    Plug 'fatih/vim-go'

    " javascript code completion
    Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }

    " php code completion
    Plug 'padawan-php/deoplete-padawan', { 'do': 'composer install' }

    " haskell code completion
    Plug 'eagletmt/neco-ghc'

    " html plugin 
    Plug 'mattn/emmet-vim'

    " typoscript // fusion
    Plug 'mstruebing/vim.typoscript'

    """""""""""""""""""""""""""""""
    " Snippets
    """""""""""""""""""""""""""""""

    " ultisnips
    Plug 'SirVer/ultisnips'

    " snippet collection
    Plug 'honza/vim-snippets'

    " ES2015 code snippets (Optional)
    Plug 'epilande/vim-es2015-snippets'

    " React code snippets
    Plug 'epilande/vim-react-snippets'

    " use editorconfig
    Plug 'editorconfig/editorconfig-vim'
    
    " () [] {} :)
    Plug 'jiangmiao/auto-pairs'

    " easily change/add/delete surroundings
    Plug 'tpope/vim-surround'

    " git plugin
    Plug 'tpope/vim-fugitive'

    " filebrowser
    Plug 'scrooloose/nerdtree'

    " completion framework
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

    " syntax checking
    " Plug 'vim-syntastic/syntastic'
    " Plug 'w0rp/ale'

    " easily comment/uncomment lines
    Plug 'tpope/vim-commentary'

    " statusline
    Plug 'itchyny/lightline.vim'

    " run commands from vim inside a tmux pane
    Plug 'benmills/vimux'

    " easily navigate between vim and tmux panes
    Plug 'christoomey/vim-tmux-navigator'

    " syntax highlights
    Plug 'sheerun/vim-polyglot'

    " scroll through different colorschemes
    Plug 'vim-scripts/ScrollColors'

    " fuzzyfinder
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'

    " show changed lines in file
    Plug 'airblade/vim-gitgutter'

    " some nice motions
    Plug 'easymotion/vim-easymotion'

    " Highlight search cursor
    Plug 'inside/vim-search-pulse'

    ":BufOnly closes all buffers
    Plug 'vim-scripts/BufOnly.vim'
call plug#end()

hi Normal guibg=NONE ctermbg=NONE
