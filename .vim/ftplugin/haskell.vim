inoremap <buffer> < <
nnoremap <buffer> <Leader>/ :s#^--\{1}\\|^#--#<CR> :set nohlsearch<CR>
nnoremap <buffer> <Leader>. :s#^--##<CR> :set nohlsearch<CR>
vnoremap <buffer> <Leader>/ :s#^--\{1}\\|^#--#<CR> :set nohlsearch<CR>
vnoremap <buffer> <Leader>. :s#^--##<CR> :set nohlsearch<CR>
noremap <buffer> <F12> :w<CR>:!ghc -Wall %<CR> " compile file with Wall flag
noremap <buffer> <F10> :w<CR>:!tmux splitw -v -l 15 'exec ghci %'<CR> " new tmux pange and load file in ghci

