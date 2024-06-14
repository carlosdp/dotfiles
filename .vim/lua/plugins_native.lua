return {
  'tpope/vim-fugitive',
  'airblade/vim-gitgutter',
  'tpope/vim-commentary',
  'nathanaelkane/vim-indent-guides',
  'vim-airline/vim-airline',
  'tpope/vim-surround',
  'embear/vim-localvimrc',

  {
    'williamboman/mason.nvim',
    config = function()
      require("mason").setup()
    end
  },
  'williamboman/mason-lspconfig.nvim',
  {
    'neovim/nvim-lspconfig',
    config = function()
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
        vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
        vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)

        -- Auto Formatting
        -- https://raw.githubusercontent.com/bennypowers/dotfiles/8f8168a32aef73654cc8de5baab61376b04d8ded/.vim/config/lsp.vim
        -- if client.resolved_capabilities.document_formatting then
        --  vim.cmd([[
        --  augroup LspFormatting
        --      autocmd! * <buffer>
        --      autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
        --  augroup END
        --  ]])
        --end
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
      local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
      capabilities.textDocument.completion.completionItem.snippetSupport = true

      -- autocmd BufWritePre * :!{bash -c "while ![ -e $1 ]; do echo $1; sleep 0.1s; done"} %:p  

      -- cmp_nvim_lsp (Autocomplete for LSP)
      -- local capabilities = vim.lsp.protocol.make_client_capabilities()
      -- capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

      vim.diagnostic.config({
        virtual_text = false,
        signs = true,
        update_in_insert = true,
        underline = true,
        severity_sort = false,
        float = {
            border = 'rounded',
            source = 'always',
            header = '',
            prefix = '',
        },
      })

      --  vim.cmd([[
      --    set signcolumn=yes
      --    autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
      --  ]])

      vim.api.nvim_create_augroup('AutoFormatting', {})
      vim.api.nvim_create_autocmd('BufWritePre', {
        pattern = '*.rs',
        group = 'AutoFormatting',
        callback = function()
          vim.lsp.buf.format({ async = false })
        end,
      })
      vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { silent=true, noremap=true })
      vim.keymap.set('n', '<leader>d', function() vim.cmd.RustLsp('openDocs') end, { silent=true, noremap=true })
      local trouble = require('trouble')
      vim.keymap.set('n', '<leader>x', function() trouble.open('diagnostics') end, { silent=true, noremap=true })

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

      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
          local bufnr = ev.buf
          local client = vim.lsp.get_client_by_id(ev.data.client_id)

          if client.server_capabilities.inlayHintProvider then
            vim.lsp.inlay_hint.enable(true)
          end
        end,
      })
    end
  },
  'mrcjkb/rustaceanvim',
  'L3MON4D3/LuaSnip',

  'folke/trouble.nvim',

  -- CMP
  {
    'hrsh7th/nvim-cmp',
    requires = {'L3MON4D3/LuaSnip'},
    config = function()
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
          { name = 'nvim_lsp_signature_help' },
          { name = 'luasnip' },
          { name = 'path' },
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        formatting = {
            fields = {'menu', 'abbr', 'kind'},
            format = function(entry, item)
                local menu_icon ={
                    nvim_lsp = 'λ',
                    vsnip = '⋗',
                    buffer = 'Ω',
                    path = '🖫',
                }
                item.menu = menu_icon[entry.source.name]
                return item
            end,
        },
      }
    end
  },
  'hrsh7th/cmp-nvim-lsp',
  'saadparwaiz1/cmp_luasnip',
  'hrsh7th/cmp-nvim-lsp-signature-help',
  'hrsh7th/cmp-path',

  'nvim-lua/plenary.nvim',
  'nvim-lua/popup.nvim',
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.6',
    requires = { {'nvim-lua/plenary.nvim'} },
    config = function()
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>f', builtin.find_files)
      vim.keymap.set('n', '<leader>g', builtin.live_grep)
    end
  },

  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
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
    end
  },

  -- Color Scheme
  'arcticicestudio/nord-vim',

  {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require'colorizer'.setup()
    end
  },

  'nvim-tree/nvim-web-devicons',
  {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      require("bufferline").setup{
        options = {
          mode = "tabs",
          diagnostics_indicator = function(count, level, diagnostics_dict, context)
            local icon = level:match("error") and " " or " "
            return " " .. icon .. count
          end
        }
      }
    end
  },
  -- Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}

  -- Plug 'pwntester/octo.nvim'

  'kyazdani42/nvim-tree.lua',

  {
    'folke/which-key.nvim',
    config = function()
      require'which-key'.setup {}
    end
  },
  {
    'phaazon/hop.nvim',
    config = function()
      require'hop'.setup {}
      vim.keymap.set('n', 'q', '<cmd>HopWord<cr>', { silent=true, noremap=true })
    end
  },

  'iden3/vim-circom-syntax',

  {
    'windwp/nvim-autopairs',
    config = function()
      require("nvim-autopairs").setup()
    end
  },
  {
    'windwp/nvim-spectre',
    config = function()
      local spectre = require('spectre')
      vim.keymap.set('n', '<leader>s', spectre.open, { silent=true, noremap=true })
    end
  }
}