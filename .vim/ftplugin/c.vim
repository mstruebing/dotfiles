" use F12 to compile the current file with gcc and -Wall flag
noremap <buffer> <F12> :w<CR>:!gcc -Wall %<CR>
inoremap <buffer> <F12> <ESC>:w<CR>:!gcc -Wall %<CR>
