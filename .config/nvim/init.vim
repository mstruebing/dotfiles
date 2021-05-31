"""""""""""
" PLUGINS "
"""""""""""


call plug#begin('~/.local/share/nvim/plugins')
"""""""""""""""""""""""""""""""
" Language Plugins
"""""""""""""""""""""""""""""""

Plug 'neoclide/coc.nvim', {'branch': 'release'}

"""""""""""""""""""""""""""""""
" Snippets
"""""""""""""""""""""""""""""""

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

" indentation show
Plug 'Yggdroot/indentLine'

" zoom in and out with <C-W>-m
Plug 'dhruvasagar/vim-zoom'

" easy debugging
Plug 'meain/vim-printer'

" Automatically resize windows to golden ratio
Plug 'dm1try/golden_size'

" Sort motion
Plug 'christoomey/vim-sort-motion'

Plug 'evansalter/vim-checklist'
call plug#end()


""""""""""""
" SETTINGS "
""""""""""""

" per project settings with local .vimrc's
set exrc
set secure


syntax on
set background=light
colorscheme delek
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
au CursorHold,CursorHoldI,FocusGained,BufEnter * checktime

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

" Split (unjoin) lines
" nnoremap K i<CR><ESC>

" some git maps
map <leader>gs :Gstatus<CR>
map <leader>gc :Gcommit<CR>
map <leader>gb :Gblame<CR>
map <leader>gl :Glog<CR>

" Git checked in files
map <leader>f :Files<CR>
map <leader>ag :Ag 
map <leader>w :Windows<CR>
map <leader>b :Buffers<CR>
map <leader>h :History<CR>

" Marks
nmap <Leader>' :Marks<CR>

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

" debugging
let g:vim_printer_print_below_keybinding = '<leader>l'
let g:vim_printer_print_above_keybinding = '<leader>L'

imap <c-x><c-l> <plug>(fzf-complete-line)

let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0

" Neomake
let g:neomake_open_list = 2
map <Leader>n :NeomakeNextLoclist<CR>
map <Leader>N :NeomakePrevLoclist<CR>

let g:gutentags_cache_dir = '~/.cache/nvim/tags/'

" reselect visual after indenting
vnoremap < <gv
vnoremap > >gv

" nerdtree
autocmd StdinReadPre * let s:std_in=1

" spell for md
autocmd BufRead,BufNewFile * set nospell
autocmd BufRead,BufNewFile *.md setlocal spell spelllang=en_us,de_de

" Highlight 80 char
let &colorcolumn=join(range(81,81),",")


"""""""""""""""""""
" PLUGIN SETTINGS "
"""""""""""""""""""

let g:python3_host_prog = '/usr/bin/python3'

function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

" lightline theme
let g:lightline = {
            \ 'colorscheme': 'solarized',
            \ 'active': {
            \   'left': [ [ 'mode', 'paste' ],
            \             [ 'fugitive', 'cocstatus', 'currentfunction' , 'readonly', 'filename', 'modified' ] ]
            \ },
            \ 'component_function': {
            \   'cocstatus': 'coc#status',
            \   'currentfunction': 'CocCurrentFunction'
            \ },
            \ 'component': {
            \   'readonly': '%{&filetype=="help"?"":&readonly?"⭤":""}',
            \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
            \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}',
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

let g:vim_printer_items = {
      \ 'typescriptreact': 'console.log("{$}:", {$})',
      \ 'elixir': 'IO.puts("{$}: {$}")',
      \ }

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
nmap <Leader>O :Notes<CR>

command! Date :r!date "+\%F"

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> <leader>k :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

augroup mygroup
  autocmd!
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" TODO LATER
" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>A  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" Default is the color of the cursor which is not good seen
highlight CocHighlightText ctermfg=Yellow

" Checklist mappings
nnoremap <leader>ct :ChecklistToggleCheckbox<cr>
nnoremap <leader>ce :ChecklistEnableCheckbox<cr>
nnoremap <leader>cd :ChecklistDisableCheckbox<cr>
vnoremap <leader>ct :ChecklistToggleCheckbox<cr>
vnoremap <leader>ce :ChecklistEnableCheckbox<cr>
vnoremap <leader>cd :ChecklistDisableCheckbox<cr>
