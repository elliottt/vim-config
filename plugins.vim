
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

" Larger CtrlP window
let g:ctrlp_match_window = 'max:20,results:20'

let g:ctrlp_mruf_relative = 1

" Special mapping to search buffers
nnoremap <CR> :CtrlPBuffer<CR>

" Silver searcher integration
if executable('ag')
    let g:ctrlp_user_command = 'ag %s --nocolor -g ""'
endif

Plugin 'junegunn/seoul256.vim'

" Haskell mode
Plugin 'elliottt/vim-haskell'

" Salty mode
Plugin 'galoisinc/vim-salty'

" Neomake, loaded before airline to make the plugin available
Plugin 'neomake/neomake'

" Airline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

if $OS != 'windows'
    " no fancy symbols on windows
    let g:airline_powerline_fonts = 1
endif

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

Plugin 'nelstrom/vim-markdown-folding'
let g:markdown_fold_style = 'nested'

call vundle#end()

" Enable filetype detection
filetype plugin indent on
