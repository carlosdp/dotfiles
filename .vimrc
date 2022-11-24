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

" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" inoremap <silent><expr> <c-space> coc#refresh()
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

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
""""" PLUGINS ~~~~~~~~~
call plug#begin('~/.vim/bundle')
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-commentary'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'vim-airline/vim-airline'
" Plug 'w0rp/ale'
Plug 'tpope/vim-surround'
Plug 'embear/vim-localvimrc'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/mason.nvim'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'L3MON4D3/LuaSnip'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Color Scheme
Plug 'arcticicestudio/nord-vim'

Plug 'norcalli/nvim-colorizer.lua'

Plug 'kyazdani42/nvim-web-devicons'
Plug 'akinsho/bufferline.nvim', { 'tag': '*' }
" Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}

Plug 'pwntester/octo.nvim'

Plug 'kyazdani42/nvim-tree.lua'

Plug 'folke/which-key.nvim'
Plug 'phaazon/hop.nvim'

Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }

Plug 'iden3/vim-circom-syntax'

Plug 'windwp/nvim-autopairs'
Plug 'windwp/nvim-spectre'
call plug#end()
"""" ~~~~~~~~~~~~~
filetype plugin indent on " This MUST be after the plugin imports

" COLOR SCHEME
set t_Co=256 " 256 colors
set background=dark
colorscheme nord
set termguicolors

" Telescope
noremap <leader>f <cmd>lua require('telescope.builtin').git_files({ file_ignore_patterns = { ".yarn/cache/.*" } })<cr>
noremap <leader>g <cmd>lua require('telescope.builtin').live_grep()<cr>

" ALE
let g:ale_fixers = {
\ 'typescript': [],
\ 'typescriptreact': [],
\ 'javascriptreact': [],
\ 'rust': ['rustfmt'],
\}

let g:ale_linters = {
\ 'typescript': [],
\ 'javascript': [],
\ 'typescriptreact': [],
\ 'javascriptreact': [],
\ 'rust': ['rls'],
\}

let g:ale_fix_on_save = 1

" Treesitter
lua << EOF
require'nvim-treesitter.configs'.setup {
  -- One of "all", "maintained" (parsers with maintainers), or a list of languages
  ensure_installed = { "c", "lua", "rust", "typescript", "tsx",
    "javascript", "jsdoc", "solidity", "python", "ruby" },

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
" highlight CocErrorSign guifg=#a82424
" nmap <leader>rn <Plug>(coc-rename)

" LSP Config
lua <<EOF
  local opts = { noremap=true, silent=true }
  vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
  vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

  -- Use an on_attach function to only map the following keys
  -- after the language server attaches to the current buffer
  local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap=true, silent=true, buffer=bufnr }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)

    -- Auto Formatting
    -- https://raw.githubusercontent.com/bennypowers/dotfiles/8f8168a32aef73654cc8de5baab61376b04d8ded/.vim/config/lsp.vim
    if client.resolved_capabilities.document_formatting then
      vim.cmd([[
      augroup LspFormatting
          autocmd! * <buffer>
          autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
      augroup END
      ]])
    end
  end

  function disable_formatting(client, bufnr)
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false
    on_attach(client, bufnr)
  end

  function enable_formatting(client, bufnr)
    client.resolved_capabilities.document_formatting = true
    client.resolved_capabilities.document_range_formatting = true
    on_attach(client, bufnr)
  end

  -- Setup lspconfig.
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  capabilities.textDocument.completion.completionItem.snippetSupport = true

  -- autocmd BufWritePre * :!{bash -c "while ![ -e $1 ]; do echo $1; sleep 0.1s; done"} %:p  

  -- cmp_nvim_lsp (Autocomplete for LSP)
  -- local capabilities = vim.lsp.protocol.make_client_capabilities()
  -- capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

  local lsp_flags = {
    -- This is the default in Nvim 0.7+
    debounce_text_changes = 150,
  }

  local util = require 'lspconfig.util'
  
  require('lspconfig')['tsserver'].setup{
      on_attach = disable_formatting,
      flags = lsp_flags,
      capabilities = capabilities,
  }
  require('lspconfig')['eslint'].setup{
      on_attach = enable_formatting,
      flags = lsp_flags,
  }
  require('lspconfig')['solidity'].setup{
      root_dir = util.root_pattern('foundry.toml', 'hardhat.config.*', '.git'),
      on_attach = enable_formatting,
      flags = lsp_flags,
  }
  require('lspconfig')['csharp_ls'].setup{
      on_attach = disable_formatting,
      flags = lsp_flags,
      capabilities = capabilities,
  }
EOF

" Mason (auto installs LSP servers)
lua require("mason").setup()

" nvim-cmp (Autocomplete for LSP)
lua <<EOF
  local luasnip = require 'luasnip' -- luasnip (Snippets)

  local cmp = require 'cmp'
  cmp.setup {
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end,
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<CR>'] = cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Replace,
        select = true,
      },
      ['<Tab>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        else
          fallback()
        end
      end, { 'i', 's' }),
      ['<S-Tab>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { 'i', 's' }),
    }),
    sources = {
      { name = 'nvim_lsp' },
      { name = 'luasnip' },
    },
  }
EOF

" Colorizer (shows colors when using hex codes and such)
lua require'colorizer'.setup()

" Auto Pairs
lua require("nvim-autopairs").setup()

" Git Gutter
highlight clear SignColumn
highlight GitGutterAdd ctermfg=green
highlight GitGutterChange ctermfg=yellow
highlight GitGutterDelete ctermfg=red
highlight GitGutterChangeDelete ctermfg=yellow

" Bufferline (top tabs)
lua <<EOF
vim.opt.termguicolors = true
require("bufferline").setup{
  options = {
    mode = "tabs",
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      local icon = level:match("error") and " " or " "
      return " " .. icon .. count
    end
  }
}
EOF

" Galaxyline
" lua require('./galaxyline')
" lua <<EOF
" local colors = require('galaxyline.colors')

" require('galaxyline').section.left[1]= {
"   FileSize = {
"     provider = 'FileSize',
"     condition = function()
"       if vim.fn.empty(vim.fn.expand('%:t')) ~= 1 then
"           return true
"       end
"       return false
"     end,
"     icon = '   ',
"     highlight = {colors.green,colors.purple},
"     separator = '',
"     separator_highlight = {colors.purple,colors.darkblue},
"   }
" }
" EOF

" Octo
lua <<EOF
require'octo'.setup({
})
EOF

" nvim-tree
lua require'nvim-tree'.setup {}
noremap z <cmd>NvimTreeToggle<cr>

" Which Key
lua require'which-key'.setup {}

" Hop
lua require'hop'.setup {}
noremap q <cmd>HopWord<cr>

" Spectre
nnoremap <leader>s <cmd>lua require('spectre').open()<CR>

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
autocmd BufNewFile,BufRead *.mdx set filetype=tsx
