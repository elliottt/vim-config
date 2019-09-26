
let g:LanguageClient_serverCommands = {
            \ 'cpp': ['/usr/local/opt/llvm/bin/clangd'],
            \ 'rust': ['cargo', 'run', 'rls'],
            \ 'ruby': ['pay', 'exec', 'scripts/bin/typecheck', '--lsp'],
            \ }

nnoremap <silent> K  :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
