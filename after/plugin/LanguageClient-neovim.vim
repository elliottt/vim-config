
let g:LanguageClient_serverCommands = {
            \ 'cpp': ['/usr/local/opt/llvm/bin/clangd'],
            \ 'rust': ['rustup', 'run', 'stable', 'rls'],
            \ 'ruby': ['pay', 'exec', 'scripts/bin/typecheck', '--lsp'],
            \ }

let g:LanguageClient_useVirtualText = 0

nnoremap <silent> K  :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> gr :call LanguageClient#textDocument_references()<CR>
nnoremap <silent> <LocalLeader>f :call LanguageClient#textDocument_formatting()<CR>
nnoremap <silent> <LocalLeader>a :call LanguageClient#textDocument_codeAction()<CR>
