"""""""""""
" PLUGINS "
"""""""""""


call plug#begin('~/.local/share/nvim/plugins')
"""""""""""""""""""""""""""""""
" Language Plugins
"""""""""""""""""""""""""""""""
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

" go plugin
Plug 'fatih/vim-go'

" javascript code completion
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }

" haskell code completion
Plug 'eagletmt/neco-ghc'

" haskell stuff
Plug 'neovimhaskell/haskell-vim'

" haskell stuff
Plug 'parsonsmatt/intero-neovim'

" html plugin 
Plug 'mattn/emmet-vim'

" Rust
Plug 'rust-lang/rust.vim'

" Elixir
Plug 'slashmili/alchemist.vim'
Plug 'mhinz/vim-mix-format'

Plug 'deoplete-plugins/deoplete-go', { 'do': 'make'}

" REQUIRED: Add a syntax file. YATS is the best
Plug 'HerringtonDarkholme/yats.vim'
Plug 'mhartington/nvim-typescript', {'do': './install.sh'}

Plug 'prettier/vim-prettier', {
            \ 'do': 'yarn install' }

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

" Cool tag handling
Plug 'ludovicchabant/vim-gutentags'

" neomake
Plug 'neomake/neomake'

" Make a buffer fullscreen
Plug 'dhruvasagar/vim-zoom'

" indentation show
Plug 'Yggdroot/indentLine'

call plug#end()


""""""""""""
" SETTINGS "
""""""""""""

" per project settings with local .vimrc's
set exrc
set secure


syntax on
set background=dark
colorscheme torte
filetype plugin on
filetype plugin indent on

" unlimited undos
set undofile
set undodir=~/.cache/nvim/undodir

" temp fix for relative numbers when a file is opened with fzf as a split or new tab
" see https://github.com/junegunn/fzf/issues/930#issuecomment-303212379
au TermOpen * set relativenumber

" runtime path
set rtp^=/usr/share/vim/vimfiles/

" Nicer searching
set incsearch               " Incremental searching
set hlsearch                " Highlight matches
set showmatch               " Show matching brackets
set ignorecase              " Search case-insensitive
set smartcase               " ...except when something is capitalized
set nospell                 " nospell by default
set noshowmode              " not needed because of lightline

" some clipboard hack
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
set list lcs=tab:\┊\ 

set number                  " Line numbering
set relativenumber

set wildmenu " Wildmode, some command completion
set wildmode=list:longest,full

set mouse=a " Enable mouse support - even in tmux \o/

" Highlight current line
set cursorline

" Deactivate swap file creation
set noswapfile

" some menu tabbing stuff
set completeopt=longest,menuone



""""""""""""
" MAPPINGS "
""""""""""""


" Switch leader key to `<Space>`
let mapleader = "\<Space>"

" cool resizing
nnoremap <Left> :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>
nnoremap <Up> :resize -2<CR>
nnoremap <Down> :resize +2<CR>

" vimux \o/
nnoremap <F11> :w<CR>:VimuxPromptCommand<CR>
nnoremap <F12> :w<CR>:VimuxRunLastCommand<CR>
noremap <leader>- :w<CR>:VimuxPromptCommand<CR>
noremap <leader>= :w<CR>:VimuxRunLastCommand<CR>

" j/k for multilines
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" toggle hlsearch
nnoremap <F3> :set hlsearch!<CR>
noremap <leader>3 :set hlsearch!<CR>

" nopaste stuff
nnoremap <F4> :set nopaste<CR>
noremap <leader>4 :set nopaste<CR>

" toggle nerdtree
map <C-t> :NERDTreeToggle<CR>

" ESC escapes terminal mode
" tnoremap <Esc> <C-\><C-n>
" tnoremap <C-k> <C-\><C-n><C-w><C-k>
" tnoremap <C-j> <C-\><C-n><C-w><C-j>
" tnoremap <C-h> <C-\><C-n><C-w><C-h>
" tnoremap <C-l> <C-\><C-n><C-w><C-l>

" Split (unjoin) lines
nnoremap K i<CR><ESC>

" some git maps
map <leader>gs :Gstatus<CR>
map <leader>gc :Gcommit<CR>
map <leader>gb :Gblame<CR>
map <leader>gl :Glog<CR>

" Git checked in files
map <leader>f :Files<CR>
map <leader>a :Ag 
map <leader>w :Windows<CR> 
map <leader>b :Buffers<CR> 
map <leader>h :History<CR> 

" Move to line
map <Leader>l <Plug>(easymotion-bd-jk)
nmap <Leader>l <Plug>(easymotion-overwin-line)
nmap <Leader>L :BLines<CR>

" Marks
nmap <Leader>' :Marks<CR>

" Tags
nmap <Leader>t :BTags<CR>
nmap <Leader>T :Tags<CR>

" easymotion
" char
nmap F <Plug>(easymotion-prefix)s
" word
nmap W <Plug>(easymotion-prefix)w
" end
nmap E <Plug>(easymotion-prefix)e
" end
nmap B <Plug>(easymotion-prefix)b

" use the last macro used instead of going into ex mode
nmap Q @@

imap <c-x><c-l> <plug>(fzf-complete-line)

" Neomake
let g:neomake_open_list = 2
map <Leader>n :NeomakeNextLoclist<CR>
map <Leader>N :NeomakePrevLoclist<CR>

let g:gutentags_cache_dir = '~/.cache/nvim/tags/'

" reselect visual after indenting
vnoremap < <gv
vnoremap > >gv


"""""""""""""
" AUTOCMD's "
"""""""""""""


autocmd Filetype go nmap <C-]> :GoDef<CR>
autocmd Filetype typescript nmap <C-]> :TSDef<CR>
autocmd Filetype haskell nmap <C-]> :InteroGoToDef<CR>
autocmd FileType elixir nmap <leader>p :MixFormat<CR>
autocmd FileType make set noexpandtab
autocmd FileType elm nmap <leader>d :call LanguageClient#textDocument_hover()<CR>

let g:alchemist_tag_stack_map = '<C-O>'

" nerdtree
autocmd StdinReadPre * let s:std_in=1

" spell for md
autocmd BufRead,BufNewFile * set nospell
autocmd BufRead,BufNewFile *.md setlocal spell spelllang=en_us,de_de

" Highlight 80 char
" autocmd Filetype markdown let &colorcolumn=join(range(81,81),",")


"""""""""""""""""""
" PLUGIN SETTINGS "
"""""""""""""""""""

let g:python3_host_prog = '/usr/bin/python3'

" neovim haskell
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords

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

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'

" use ag
let $FZF_DEFAULT_COMMAND = 'ag --hidden -g ""'

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" deoplete config
let g:deoplete#enable_at_startup = 1
let g:deoplete#min_pattern_length = 1
inoremap <silent><expr><TAB> deoplete#mappings#manual_complete()

" UltiSnips config
inoremap <silent><expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <silent><expr><s-TAB> pumvisible() ? "\<C-p>" : "\<TAB>"
let g:UltiSnipsExpandTrigger = "<nop>"
inoremap <expr> <CR> pumvisible() ? "<C-R>=UltiSnips#ExpandSnippetOrJump()<CR>" : "\<CR>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsSnippetsDir="~/.config/nvim/snips"
let g:UltiSnipsSnippetDirectories=["snips", "UltiSnips"]

" show hidden files by default
let NERDTreeShowHidden=1

" disable ctrl-t mapping
let g:go_def_mapping_enabled = 0

let g:LanguageClient_serverCommands = {
    \ 'elm': [ 'elm-language-server', '--stdio' ]
    \ }

let g:LanguageClient_rootMarkers = {
    \ 'elm': ['elm.json']
    \ }

let g:LanguageClient_settingsPath = '~/.config/nvim/settings.json'

nmap <leader>5 :call LanguageClient_contextMenu()<CR>
nmap <leader>f5 :call LanguageClient_contextMenu()<CR>

" Enable autoformat for elixir
let g:mix_format_on_save = 1

""""""""""""
" SESSIONS "
""""""""""""


" http://vim.wikia.com/wiki/Go_away_and_come_back
" Creates a session
function! MakeSession()
    let b:sessiondir = $HOME . "/.cache/nvim/sessions" . getcwd()
    if (filewritable(b:sessiondir) != 2)
        exe 'silent !mkdir -p ' b:sessiondir
        redraw!
    endif
    let b:sessionfile = b:sessiondir . '/session.vim'
    exe 'mksession! ' . b:sessionfile
endfunction

" Loads a session if it exists
function! LoadSession()
    let b:sessiondir = $HOME . '/.cache/nvim/sessions' . getcwd()
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




hi Normal guibg=NONE ctermbg=NONE

function! MyOnBattery()
    return readfile('/sys/class/power_supply/AC/online') == ['0']
endfunction

if MyOnBattery()
    call neomake#configure#automake('w')
else
    call neomake#configure#automake('nrwi', 500)
endif

command! Notes tabnew ~/projects/own/log/notes.md
nmap <Leader>nn :Notes<CR>

call deoplete#custom#source('_', 'sorters', ['sorter_word'])
call deoplete#custom#source('ultisnips', 'rank', 9999)
