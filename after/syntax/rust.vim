
augroup rust
    " Format before write
    au BufWritePre *.rs call LanguageClient#textDocument_formatting()
augroup END
