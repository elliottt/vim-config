
if executable('rg')
    nnoremap <silent> <space> :call fzf#run({ 'source': 'rg --files', 'sink': 'e', 'down': '30%' })<CR>
else
    nnoremap <silent> <space> :FZF<CR>
end
