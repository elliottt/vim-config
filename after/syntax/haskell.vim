setlocal autoindent
setlocal nocindent
setlocal expandtab

setlocal include="^\s*import\s\+\(qualified\s\+\)\?\zs[^ \t]\+\ze"
setlocal includeexpr=substitute(v:fname,'\\.','/','g').'.hs'

highlight hsComment term=NONE ctermfg=cyan

nnoremap <buffer> K <Nop>

" Insert a separating line
nnoremap <buffer> --l ^80i-<Esc>^llR<Space>

" Insert a Haddock comment
nnoremap <buffer> --\| O--<Space>\|<Space>

" Insert a language pragma
nnoremap <buffer> <localleader>l O{-# LANGUAGE  #-}<Esc>hhhi

" Insert an import declaration
nnoremap <buffer> <localleader>i Oimport 

" Set the tab size
setlocal tabstop=8
setlocal shiftwidth=2
