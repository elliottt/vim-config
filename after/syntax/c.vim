set cindent

set tabstop=8
set shiftwidth=4
set expandtab

if has("cscope")
	nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
endif
