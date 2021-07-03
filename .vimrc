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

" Additional Settings for CoC
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <c-space> coc#refresh()
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

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
call plug#begin('~/.vim/bundle')
Plug 'gmarik/Vundle.vim'
Plug 'kien/ctrlp.vim'
Plug 'fisadev/vim-ctrlp-cmdpalette'
Plug 'tpope/vim-fugitive'
Plug 'sjl/gundo.vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-commentary'
Plug 'nathanaelkane/vim-indent-guides'
" Plin 'fatih/vim-go'
Plug 'rizzatti/dash.vim'
Plug 'vim-airline/vim-airline'
Plug 'leafgarland/typescript-vim'
Plug 'ianks/vim-tsx'
Plug 'Shougo/vimproc'
Plug 'w0rp/ale'
Plug 'rust-lang/rust.vim'
Plug 'jparise/vim-graphql'
Plug 'mxw/vim-jsx'
Plug 'tpope/vim-surround'
" Plug 'valloric/youcompleteme'
Plug 'embear/vim-localvimrc'
Plug 'dyng/ctrlsf.vim'
" Plug 'zxqfl/tabnine-vim'
Plug 'tomlion/vim-solidity'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dart-lang/dart-vim-plugin'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
call plug#end()
"""" ~~~~~~~~~~~~~
filetype plugin indent on " This MUST be after the Vundle imports

" Command-T
noremap <leader>f <cmd>lua require('telescope.builtin').find_files()<cr>
noremap <leader>g <cmd>lua require('telescope.builtin').live_grep()<cr>

" Command Palette
map <leader>p :CtrlPCmdPalette<cr>
let g:ctrlp_cmdpalette_execute = 1

" ALE
let g:ale_fixers = {
\ 'typescript': [],
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

" Use double tick on iPad because no esc key
imap `` <Esc>

autocmd BufNewFile,BufRead *.rs set filetype=rust
