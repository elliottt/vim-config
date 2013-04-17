set cindent

set tabstop=8
set expandtab
set shiftwidth=4

if has("cscope")
    nnoremap <buffer> <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
endif

" Insert a separating line
nnoremap <buffer> --l ^i/* <Esc>76a*<Esc>A/<Esc>F lR

" Insert a system include
nnoremap <localleader>i O#include <><Esc>i
nnoremap <localleader>I O#include ""<Esc>i
