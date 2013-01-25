setlocal autoindent
setlocal nocindent
setlocal expandtab

setlocal include="^\s*import\s\+\(qualified\s\+\)\?\zs[^ \t]\+\ze"
setlocal includeexpr=substitute(v:fname,'\\.','/','g').'.hs'

highlight hsComment term=NONE ctermfg=cyan

nmap <buffer> K <Nop>

" Insert a separating line
nmap <buffer> --l ^80i-<Esc>^llR<Space>

" Insert a Haddock comment
nmap <buffer> --\| O--<Space>\|<Space>

" Insert a language pragma
nmap <buffer> <localleader>l O{-# LANGUAGE  #-}<Esc>hhhi

" Insert an import declaration
nmap <buffer> <localleader>i Oimport 

" Set the tab size
setlocal tabstop=8
setlocal shiftwidth=2
