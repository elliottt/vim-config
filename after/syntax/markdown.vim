setlocal nofoldenable
setlocal spell

nnoremap <localleader>l o<Esc>80R-<Esc>0
nnoremap <localleader>L o<Esc>80R=<Esc>0

function! MarkdownRegion_(md, syn)
    call SyntaxRange#Include('```' . a:md, '```', a:syn)
endfunction

function! MarkdownRegion(syn)
    call MarkdownRegion_(a:syn,a:syn)
endfunction

call MarkdownRegion('c')
call MarkdownRegion('haskell')
