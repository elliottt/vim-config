setlocal autoindent
setlocal nocindent
setlocal expandtab

setlocal include=^import
setlocal includeexpr=substitute(substitute(v:fname,'\\.','/','g'),'$','.hs','')

highlight hsComment term=NONE ctermfg=cyan

map K <Nop>

" Insert a separating line
map --l ^80i-<Esc>^llR<Space>

" Insert a Haddock comment
map --\| O--<Space>\|<Space>

" Insert a language pragma
map pL O{-# LANGUAGE  #-}<Esc>hhhi

" Insert an inline pragma
map pI O{-# INLINE  #-}<Esc>hhhi

" Set the tab size
set tabstop=8
set shiftwidth=2

set spell
