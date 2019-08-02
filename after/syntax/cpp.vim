augroup cpp
    " Format before write
    au BufWritePre *.cc call CocAction('format')
augroup END
