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
map <Leader>l O{-# LANGUAGE  #-}<Esc>hhhi

" Insert an inline pragma
map <Leader>i O{-# INLINE  #-}<Esc>hhhi

" Set the tab size
setlocal tabstop=8
setlocal shiftwidth=2
