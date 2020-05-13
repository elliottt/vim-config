
" {{{ vim-plug Setup
set nocompatible

" Setup plugins
filetype off

set rtp+=$VIMHOME/bundle/vim-plug
call plug#begin($VIMHOME . '/bundle')
" }}}

" two-trucs {{{
Plug 'elliottt/two-trucs', { 'do': 'make release' }
" }}}

" LanguageClient-neovom {{{
Plug 'autozimu/LanguageClient-neovim', {
            \ 'branch': 'next',
            \ 'do': 'bash install.sh',
            \ }
" }}}

" fzf {{{
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" }}}

" {{{ Color Themes
Plug 'junegunn/seoul256.vim'
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

" {{{ Editing
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'jez/vim-superman'
" }}}

" {{{ Snippets
Plug 'SirVer/ultisnips'
" }}}

" {{{ Initialize plugins
call plug#end()
filetype on
" }}}
