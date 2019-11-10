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
set background=dark
colorscheme lucius

" Tab Navigation
" https://superuser.com/questions/410982/in-vim-how-can-i-quickly-switch-between-tabs
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>
au TabLeave * let g:lasttab = tabpagenr()
nnoremap <silent> <c-l> :exe "tabn ".g:lasttab<cr>
vnoremap <silent> <c-l> :exe "tabn ".g:lasttab<cr>

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
" Plugin 'fatih/vim-go'
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
Plugin 'embear/vim-localvimrc'
Plugin 'dyng/ctrlsf.vim'
Plugin 'zxqfl/tabnine-vim'
Plugin 'tomlion/vim-solidity'
call vundle#end()
"""" ~~~~~~~~~~~~~
filetype plugin indent on " This MUST be after the Vundle imports

" Command-T
map <leader>f :CtrlP<cr>
map <leader>bf :CtrlPMixed<cr>
let g:ctrlp_custom_ignore = 'target'

let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard | if (test -a .ctrlpignore); then grep -v "`cat .ctrlpignore`"; else cat; fi']

" ALE
let g:ale_fixers = {
\ 'typescript': ['eslint'],
\ 'rust': ['rustfmt'],
\}

let g:ale_linters = {
\ 'typescript': ['eslint', 'tsserver', 'typecheck'],
\ 'javascript': ['eslint'],
\ 'rust': ['rls'],
\}

let g:ale_fix_on_save = 1

" Rust
let g:rustfmt_autosave = 1
let g:rustfmt_command = "cargo fmt -- "
" let g:ale_rust_cargo_use_check = 1
au FileType rust nmap gd <Plug>(rust-def)
au FileType rust nmap gs <Plug>(rust-def-split)
au FileType rust nmap gx <Plug>(rust-def-vertical)
au FileType rust nmap <leader>gd <Plug>(rust-doc)
let g:ale_rust_rls_toolchain = 'stable'
let g:ale_lint_on_text_changed = 'normal'
" TODO: Might want to scope to Typescript only
let g:ale_lint_delay = 500
let g:ale_completion_delay = 200
let g:ale_open_list = 0
let g:ale_echo_msg_format = '[%linter%] %s'

" vim-jsx
let g:jsx_ext_required = 0

" YCM
let g:ycm_show_diagnostics_ui = 0

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

" Local lvimrc loading
let g:localvimrc_ask = 0
let g:localvimrc_sandbox = 0

" Clear Search
nnoremap <CR> :noh<CR><CR>

autocmd BufNewFile,BufRead *.rs set filetype=rust
