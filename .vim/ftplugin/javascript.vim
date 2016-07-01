" F12 to save current file and let it run through node
noremap <buffer> <F12> :w<CR>:!node %<CR>
inoremap <buffer> <F12> <ESC>:w<CR>:!node %<CR>
