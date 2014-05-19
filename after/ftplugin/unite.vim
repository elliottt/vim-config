imap <buffer> <C-j> <Plug>(unite_select_next_line)
imap <buffer> <C-k> <Plug>(unite_select_previous_line)
imap <buffer> <F5>  <Plug>(unite_redraw)

imap <silent><buffer><expr> <C-g> unite#do_action('tabopen')

inoremap <buffer> <C-c> <Esc>:q<Cr>
