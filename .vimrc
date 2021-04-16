" syntax highlighting
syntax on
filetype indent plugin on

set bs=2
set nocompatible
set nohlsearch
set showcmd
set ruler
set showmode
set noerrorbells
set viminfo='50
set shiftwidth=4
set tabstop=4
set cindent
set expandtab

" fold based on file type, but don't fold by default
set foldmethod=syntax
set nofoldenable

" don't indent namespaces in c++
set cino=N-s

" ctrl-p fast-file finder
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_cmd = 'CtrlPMRU'

" split shortcuts: ctrl-J etc to move between splits
nnoremap <C-H> <C-W>h
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l

" more natural split opening
set splitbelow
set splitright

set colorcolumn=80
