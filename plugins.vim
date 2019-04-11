
" {{{ Vundle Setup
set nocompatible

" Setup plugins
filetype off

set rtp+=$VIMHOME/bundle/Vundle.vim
call vundle#begin($VIMHOME . '/bundle')

Plugin 'VundleVim/Vundle.vim'
" }}}

" {{{ CtrlP
Plugin 'ctrlpvim/ctrlp.vim'

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

" Special mapping to search tags
nnoremap <LocalLeader><Space> :CtrlPTag<CR>

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
    Plugin 'nixprime/cpsm'

    " NOTE: for this to work in neovim, the `pynvim` python module must be
    " installed. `pip3 install --user neovim`

    let g:ctrlp_match_func = {'match': 'cpsm#CtrlPMatch'}
    let g:cpsm_match_empty_query = 0
end
" }}}
" }}}

" {{{ Color Themes
" Plugin 'junegunn/seoul256.vim'
Plugin 'jnurmine/Zenburn'
let g:zenburn_transparent = 1
" }}}

" {{{ Haskell
Plugin 'elliottt/vim-haskell'
" }}}

" {{{ Airline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

if $OS != 'windows'
    " no fancy symbols on windows
    let g:airline_powerline_fonts = 1
endif
" }}}

" {{{ Text alignment
Plugin 'tommcdo/vim-lion'
" }}}

" {{{ Tmux integration
Plugin 'benmills/vimux'
" }}}

" {{{ tpope plugins
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-dispatch'
" }}}

" {{{ Simple auto-completion
Plugin 'ajh17/VimCompletesMe'
" }}}

" {{{ Sayonara
Plugin 'mhinz/vim-sayonara'
" }}}

" {{{ Markdown
Plugin 'nelstrom/vim-markdown-folding'
let g:markdown_fold_style = 'nested'
" }}}

" {{{ Vundle cleanup
call vundle#end()

" Enable filetype detection
filetype plugin indent on
" }}}
