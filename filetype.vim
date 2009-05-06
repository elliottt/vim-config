if exists("did_load_filetypes")
  finish
endif

augroup filetypedetect

  " Haskell stuff
  au! BufNewFile,BufRead *.hsc setfiletype haskell
  au! BufNewFile,BufRead *.l setfiletype haskell

  " String Template
  au! BufNewFile,BufRead *.st setfiletype xml

  " TeX
  au! BufNewFile,BufRead *.tex setlocal spell

augroup END
