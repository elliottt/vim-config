set cindent

set tabstop=8
set expandtab
set shiftwidth=4

if has("cscope")
	nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
endif

" Insert a separating line
map --l ^i/* <Esc>76a*<Esc>A/<Esc>F lR
