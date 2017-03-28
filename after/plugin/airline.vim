
" always show the status line
set laststatus=2

if $OS != 'windows'
    if !exists('g:airline_symbols')
        let g:airline_symbols = {}
    endif

    " tabline config
    let g:airline#extensions#tabline#enabled = 1
endif

let g:airline_theme = 'bubblegum'


" neomake config
let g:airline#extensions#neomake#enabled = 1

" trailing whitespace
let g:airline#extensions#whitespace#enabled = 0

" only display the filename in the tabline
let g:airline#extensions#tabline#fnamemod = ':t'
