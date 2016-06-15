inoremap <buffer> < <
nnoremap <buffer> <Leader>/ :s#^--\{1}\\|^#--#<CR> :set nohlsearch<CR>
nnoremap <buffer> <Leader>. :s#^--##<CR> :set nohlsearch<CR>
vnoremap <buffer> <Leader>/ :s#^--\{1}\\|^#--#<CR> :set nohlsearch<CR>
vnoremap <buffer> <Leader>. :s#^--##<CR> :set nohlsearch<CR>
noremap <buffer> <F12> :w<CR>:!ghc %<CR>

