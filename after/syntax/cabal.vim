setlocal expandtab
setlocal autoindent

nnoremap <buffer> <silent> <localleader>b :call VimuxRunCommand('cabal build')<Cr>
