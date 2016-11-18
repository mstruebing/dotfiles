noremap <buffer> <F12> :w<CR>:!javac % && cd %:h && java %:t:r<CR>
inoremap <buffer> <F12> <ESC>:w<CR>:!javac % && cd %:h && java %:t:r<CR>
