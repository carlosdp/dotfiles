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
" Plug 'gmarik/Vundle.vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-commentary'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'vim-airline/vim-airline'
Plug 'w0rp/ale'
Plug 'tpope/vim-surround'
Plug 'embear/vim-localvimrc'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'arcticicestudio/nord-vim'
call plug#end()
"""" ~~~~~~~~~~~~~
filetype plugin indent on " This MUST be after the Vundle imports

" COLOR SCHEME
set t_Co=256 " 256 colors
set background=dark
colorscheme nord
set termguicolors

" Telescope
noremap <leader>f <cmd>lua require('telescope.builtin').find_files()<cr>
noremap <leader>g <cmd>lua require('telescope.builtin').live_grep()<cr>

" ALE
let g:ale_fixers = {
\ 'typescript': ['eslint'],
\ 'rust': ['rustfmt'],
\}

let g:ale_linters = {
\ 'typescript': ['eslint'],
\ 'javascript': ['eslint'],
\ 'rust': ['rls'],
\}

let g:ale_fix_on_save = 1

" Treesitter
lua << EOF
require'nvim-treesitter.configs'.setup {
  -- One of "all", "maintained" (parsers with maintainers), or a list of languages
  ensure_installed = "maintained",

  -- Install languages synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- List of parsers to ignore installing
  ignore_install = { },

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    disable = { },

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },

  indent = {
    enable = true,
  },
}
EOF

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

" COC
highlight CocErrorSign guifg=#a82424

" Git Gutter
highlight clear SignColumn
highlight GitGutterAdd ctermfg=green
highlight GitGutterChange ctermfg=yellow
highlight GitGutterDelete ctermfg=red
highlight GitGutterChangeDelete ctermfg=yellow

" Local lvimrc loading
let g:localvimrc_ask = 1
let g:localvimrc_sandbox = 1

" Clear Search
nnoremap <CR> :noh<CR><CR>

if has("unix")
  let s:uname = system("uname -s")
  if s:uname != "Darwin\n"
    " Use double tick on iPad because no esc key
    imap `` <Esc>
  endif
endif

autocmd BufNewFile,BufRead *.rs set filetype=rust
autocmd BufNewFile,BufRead *.sol set filetype=solidity
