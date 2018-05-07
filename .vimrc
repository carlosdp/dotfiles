" Standard
syntax on
let mapleader = ","
set t_Co=256
set ts=2
set backspace=2
set number
set expandtab
set shiftwidth=2
set softtabstop=2
set autoindent
set noswapfile
set shell=bash
set scrolloff=3
set wildmode=longest,list
set laststatus=2
" make tab completion for files/buffers act like bash
set wildmenu
set timeoutlen=1000 ttimeoutlen=0
set hidden

" Folding
set foldenable
set foldlevelstart=1
set foldnestmax=1
nnoremap <space> za
set foldmethod=indent   " fold based on indent level

" COLOR SCHEME
set t_Co=256 " 256 colors
set background=light
colorscheme lucius


filetype off
""""" VUNDLE ~~~~~~~~~
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'sjl/gundo.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-commentary'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'fatih/vim-go'
Plugin 'rizzatti/dash.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'leafgarland/typescript-vim'
Plugin 'ianks/vim-tsx'
Plugin 'Shougo/vimproc'
Plugin 'w0rp/ale'
Plugin 'rust-lang/rust.vim'
Plugin 'jparise/vim-graphql'
Plugin 'mxw/vim-jsx'
Plugin 'tpope/vim-surround'
Plugin 'valloric/youcompleteme'
call vundle#end()
"""" ~~~~~~~~~~~~~
filetype plugin indent on " This MUST be after the Vundle imports

" Command-T
map <leader>f :CtrlP<cr>
map <leader>bf :CtrlPMixed<cr>
let g:ctrlp_custom_ignore = 'target'

let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" ALE
let g:ale_fixers = {
\ 'typescript': ['tslint'],
\}

let g:ale_linters = {
\ 'typescript': ['tslint', 'tsserver', 'typecheck'],
\ 'rust': ['rls'],
\}

let g:ale_fix_on_save = 1

" Rust
let g:rustfmt_autosave = 1
let g:rustfmt_command = "cargo fmt -- "
let g:ale_rust_cargo_use_check = 1
au FileType rust nmap gd <Plug>(rust-def)
au FileType rust nmap gs <Plug>(rust-def-split)
au FileType rust nmap gx <Plug>(rust-def-vertical)
au FileType rust nmap <leader>gd <Plug>(rust-doc)
let g:ale_rust_rls_toolchain = 'stable'

" vim-jsx
let g:jsx_ext_required = 0

" Undo List
nnoremap <leader>w :GundoToggle<CR>

" Brings up Dash on the term under cursor
nnoremap <leader>d :Dash!<CR>

" Git Gutter
highlight clear SignColumn
highlight GitGutterAdd ctermfg=green
highlight GitGutterChange ctermfg=yellow
highlight GitGutterDelete ctermfg=red
highlight GitGutterChangeDelete ctermfg=yellow

