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

inoremap { {<CR><CR>}<up><Tab>
inoremap ( (<CR><CR>)<up><Tab>
inoremap [ [<CR><CR>]<up><Tab>
