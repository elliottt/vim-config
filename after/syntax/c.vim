set cindent

set tabstop=8
set expandtab
set shiftwidth=4

if has("cscope")
    nmap <buffer> <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
endif

" Insert a separating line
nmap <buffer> --l ^i/* <Esc>76a*<Esc>A/<Esc>F lR

" Insert a system include
nmap <localleader>i O#include <><Esc>i
nmap <localleader>I O#include ""<Esc>i
