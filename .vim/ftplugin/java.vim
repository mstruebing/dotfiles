noremap <buffer> <F12> :w<CR>:!javac % && cd %:h && java %:t:r<CR>
inoremap <buffer> <F12> <ESC>:w<CR>:!javac % && cd %:h && java %:t:r<CR>

" Sysout \o/
iabbrev sysout System.out.println(<Right>;<Left><Left>
iabbrev syserr System.err.println(<Right>;<Left><Left>
