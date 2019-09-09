
" {{{ vim-plug Setup
set nocompatible

" Setup plugins
filetype off

set rtp+=$VIMHOME/bundle/vim-plug
call plug#begin($VIMHOME . '/bundle')
" }}}

" {{{ CtrlP
Plug 'ctrlpvim/ctrlp.vim'

let g:ctrlp_map = '<Space>'

let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("t")': [ '<c-g>' ],
    \ 'MarkToOpen()':         [ '<c-z>', '<c-t>' ]
    \ }

let g:ctrlp_open_new_file = 'r'

let g:ctrlp_extensions = [ 'mixed', 'quickfix', 'undo' ]

" Larger CtrlP window
let g:ctrlp_match_window = 'max:20,results:20'

let g:ctrlp_mruf_relative = 1

let g:ctrlp_open_multiple_files='1r'

" Start indexing from the current working directory
let g:ctrlp_working_path_mode = 'w'

" Special mapping to search buffers
nnoremap <Leader><Space> :CtrlPBuffer<CR>

" Silver searcher/ripgrep integration
if executable('rg')
    let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
    let g:ctrlp_use_caching = 1
elseif executable('ag')
    let g:ctrlp_user_command = 'ag %s --nocolor --nogroup -g ""'
    let g:ctrlp_use_caching = 1
endif

"let g:ctrlp_lazy_update = 100

" {{{ CPSM for CtrlP (when not on windows)
if $OS != 'windows'
    Plug 'nixprime/cpsm'

    " NOTE: for this to work in neovim, the `pynvim` python module must be
    " installed. `pip3 install --user neovim`

    let g:ctrlp_match_func = {'match': 'cpsm#CtrlPMatch'}
    let g:cpsm_match_empty_query = 0
end
" }}}
" }}}

" coc.nvim {{{
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
" }}}

" {{{ Color Themes
" Plug 'junegunn/seoul256.vim'
Plug 'jnurmine/Zenburn'
let g:zenburn_transparent = 1
" }}}

" {{{ Haskell
Plug 'elliottt/vim-haskell'
" }}}

" {{{ Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

if $OS != 'windows'
    " no fancy symbols on windows
    let g:airline_powerline_fonts = 1
endif
" }}}

" {{{ Text alignment
Plug 'tommcdo/vim-lion'
" }}}

" {{{ Tmux integration
Plug 'benmills/vimux'
" }}}

" {{{ tpope plugins
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
" }}}

" {{{ Sayonara
Plug 'mhinz/vim-sayonara'
" }}}

" {{{ Markdown
Plug 'nelstrom/vim-markdown-folding'
let g:markdown_fold_style = 'nested'
" }}}

" {{{ vim-plug cleanup
call plug#end()

" Enable filetype detection
filetype plugin indent on
" }}}
