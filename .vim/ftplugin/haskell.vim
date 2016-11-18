inoremap <buffer> < <

" comments SPACE+/, SPACE+.
nnoremap <buffer> <Leader>/ :s#^--\{1}\\|^#--#<CR> :set nohlsearch<CR>
nnoremap <buffer> <Leader>. :s#^--##<CR> :set nohlsearch<CR>
vnoremap <buffer> <Leader>/ :s#^--\{1}\\|^#--#<CR> :set nohlsearch<CR>
vnoremap <buffer> <Leader>. :s#^--##<CR> :set nohlsearch<CR>

" F12 to save and compile current file with ghc and -Wall flag
noremap <buffer> <F12> :w<CR>:!ghc -Wall %<CR>
inoremap <buffer> <F12> <ESC>:w<CR>:!ghc -Wall %<CR>

" F10 to save current file and open a new tmux pane where ghci is loaded with this
" file
noremap <buffer> <F10> :w<CR>:!tmux splitw -v -l 15 'stack exec ghci %'<CR> 
inoremap <buffer> <F10> <ESC>:w<CR>:!tmux splitw -v -l 15 'stack exec ghci %'<CR> 

