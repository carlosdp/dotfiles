-- Standard
-- DO I NEED THIS?
-- syntax on
vim.g.mapleader = ","
vim.opt.ts=2
-- vim.opt.backspace=2
vim.opt.number=true
vim.opt.expandtab=true
vim.opt.shiftwidth=2
vim.opt.softtabstop=2
vim.opt.autoindent=true
-- vim.opt.noswapfile=true
vim.opt.shell="bash"
vim.opt.scrolloff=3
vim.opt.wildmode="longest,list"
vim.opt.laststatus=2
-- make tab completion for files/buffers act like bash
vim.opt.wildmenu=true
vim.opt.timeoutlen=1000
vim.opt.hidden=true
vim.opt.termguicolors = true -- REQUIRED

-- Folding
vim.opt.foldenable=true
vim.opt.foldlevelstart=1
vim.opt.foldnestmax=1
vim.keymap.set("n", "<space>", "za")
vim.opt.foldmethod="indent" -- fold based on indent level

-- function! s:check_back_space() abort
--   let col = col('.') - 1
--   return !col || getline('.')[col - 1]  =~# '\s'
-- endfunction

-- Tab Navigation
-- https://superuser.com/questions/410982/in-vim-how-can-i-quickly-switch-between-tabs
if not vim.g.vscode then
  vim.keymap.set("n", "<leader>1", "1gt")
  vim.keymap.set("n", "<leader>2", "2gt")
  vim.keymap.set("n", "<leader>3", "3gt")
  vim.keymap.set("n", "<leader>4", "4gt")
  vim.keymap.set("n", "<leader>5", "5gt")
  vim.keymap.set("n", "<leader>6", "6gt")
  vim.keymap.set("n", "<leader>7", "7gt")
  vim.keymap.set("n", "<leader>8", "8gt")
  vim.keymap.set("n", "<leader>9", "9gt")
  vim.keymap.set("n", "<leader>0", ":tablast<cr>")
  vim.cmd([[
    au TabLeave * let g:lasttab = tabpagenr()
  ]])
  vim.keymap.set("n", "<c-l>", ":exe \"tabn \".g:lasttab<cr>", { silent = true })
  vim.keymap.set("v", "<c-l>", ":exe \"tabn \".g:lasttab<cr>", { silent = true })
end

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  { import = "plugins_always", cond = true },
  { import = "plugins_native", cond = (function() return not vim.g.vscode end) },
  { import = "plugins_vscode", cond = (function() return vim.g.vscode end) },
})

if vim.g.vscode then
  require "vscode_bindings" 
end

-- COLOR SCHEME
vim.opt.background="dark"
-- colorscheme nord

-- nvim-cmp (Autocomplete for LSP)

--Set completeopt to have a better completion experience
-- :help completeopt
-- menuone: popup even when there's only one match
-- noinsert: Do not insert text until a selection is made
-- noselect: Do not select, force to select one from the menu
-- shortness: avoid showing extra messages when using completion
-- updatetime: set updatetime for CursorHold
vim.opt.completeopt = {'menuone', 'noselect', 'noinsert'}
vim.opt.shortmess = vim.opt.shortmess + { c = true}
vim.api.nvim_set_option('updatetime', 300) 

-- Fixed column for diagnostics to appear
-- Show autodiagnostic popup on cursor hover_range
-- Goto previous / next diagnostic warning / error 
-- Show inlay_hints more frequently 
vim.cmd([[
  set signcolumn=yes
  autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
]])

-- " Git Gutter
-- highlight clear SignColumn
-- highlight GitGutterAdd ctermfg=green
-- highlight GitGutterChange ctermfg=yellow
-- highlight GitGutterDelete ctermfg=red
-- highlight GitGutterChangeDelete ctermfg=yellow

-- nvim-tree
-- require'nvim-tree'.setup {}
-- noremap z <cmd>NvimTreeToggle<cr>

-- Local lvimrc loading
vim.g.localvimrc_ask = 1
vim.g.localvimrc_sandbox = 1

-- Clear Search
vim.keymap.set('n', '<CR>', ':noh<CR><CR>', { silent=true, noremap=true })

-- if has("unix")
--   let s:uname = system("uname -s")
--   if s:uname != "Darwin\n"
--     " Use double tick on iPad because no esc key
--     imap `` <Esc>
--   endif
-- endif

-- autocmd BufNewFile,BufRead *.rs set filetype=rust
-- autocmd BufNewFile,BufRead *.sol set filetype=solidity
-- autocmd BufNewFile,BufRead *.mdx set filetype=tsx
