inoremap <buffer> < <
nnoremap <buffer> <c-_> :s#^--\{1}\\|^#--#<CR> :set nohlsearch<CR>
vnoremap <buffer> <c-_> :s#^--\{1}\\|^#--#<CR> :set nohlsearch<CR>
noremap <buffer> <F12> :w<CR>:!ghc %<CR>





