
set nocompatible

" Setup plugins
filetype off

set rtp+=$VIMHOME/bundle/Vundle.vim
call vundle#begin()

" Vundle
Plugin 'VundleVim/Vundle.vim'

" CtrlP
Plugin 'ctrlpvim/ctrlp.vim'
let g:ctrlp_map = '<Space>'
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("t")': [ '<c-g>' ]
    \ }
let g:ctrlp_open_new_file = 'r'
let g:ctrlp_extensions = [ 'mixed', 'quickfix', 'undo' ]
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_match_window = 'max:20,results:20'
let g:ctrlp_mruf_relative = 1
nnoremap <C-@> :CtrlPBuffer<CR>

" Silver searcher integration
if executable('ag')
    let g:ctrlp_user_command = 'ag %s --nocolor -g ""'
endif

Plugin 'junegunn/seoul256.vim'

" Haskell mode
Plugin 'elliottt/vim-haskell'

" Salty mode
Plugin 'galoisinc/vim-salty'

" Airline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
set laststatus=2
if $OS != 'windows'
    if !exists('g:airline_symbols')
        let g:airline_symbols = {}
    endif

    " tabline config
    let g:airline#extensions#tabline#enabled = 1

    " empty git branch value
    let g:airline#extensions#branch#empty_message = ' '

    " no fancy symbols on windows
    let g:airline_powerline_fonts = 1

    " Airline output for tmux
    " Plugin 'edkolev/tmuxline.vim'
    " let g:tmuxline_preset = 'powerline'
endif

let g:airline_theme = 'bubblegum'

" Text alignment
Plugin 'tommcdo/vim-lion'

" Tmux integration
Plugin 'benmills/vimux'

Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-dispatch'

Plugin 'ajh17/VimCompletesMe'

Plugin 'idris-hackers/idris-vim'

Plugin 'mhinz/vim-sayonara'

Plugin 'fsharp/vim-fsharp'

Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"

call vundle#end()

" Enable filetype detection
filetype plugin indent on
