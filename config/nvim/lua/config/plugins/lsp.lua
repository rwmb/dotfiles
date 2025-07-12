return {
  { 'williamboman/mason.nvim', },
  { 'williamboman/mason-lspconfig.nvim', },
  {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-path'},
      {'hrsh7th/cmp-cmdline'},
    },
    config = function()
      local cmp = require("cmp")
      local opts = {}

      -- Util Functions
      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      -- Specify snippet engine
      opts.snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body)
        end
      }

      -- Sources
      opts.sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'buffer' },
      }

      -- Disable on comments
      opts.enabled = function()
        local disabled = false
        disabled = disabled or (vim.api.nvim_get_option_value('buftype', { buf = 0 }) == 'prompt')
        disabled = disabled or (vim.fn.reg_recording() ~= '')
        disabled = disabled or (vim.fn.reg_executing() ~= '')
        disabled = disabled or require('cmp.config.context').in_treesitter_capture('comment')
        return not disabled
      end

      -- Mappings
      opts.mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.

        -- SuperTab
        ['<Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            -- You could replace select_next_item() with confirm({ select = true }) to get VS Code autocompletion behavior
            cmp.select_next_item()
          elseif vim.snippet.active({ direction = 1 }) then
            vim.schedule(function()
              vim.snippet.jump(1)
            end)
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif vim.snippet.active({ direction = -1 }) then
            vim.schedule(function()
              vim.snippet.jump(-1)
            end)
          else
            fallback()
          end
        end, { "i", "s" }),
      })

      opts.window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },

      -- Autocomplete searches with buffer
      cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' }
        }
      })

      -- Autocomplete commands
      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({{ name = 'path' }}, {{name = 'cmdline'}}),
        matching = { disallow_symbol_nonprefix_matching = false }
      })

      cmp.setup(opts)
    end,
  },
  {
    'neovim/nvim-lspconfig',
    config = function()
      require('mason').setup()
      require('mason-lspconfig').setup({})
      local lspconfig = require('lspconfig')
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      lspconfig.ts_ls.setup({capabilities = capabilities})
      lspconfig.angularls.setup({capabilities = capabilities})
      lspconfig.emmet_language_server.setup({capabilities = capabilities})
      lspconfig.clangd.setup {
        capabilities = capabilities,  -- enable nvim-cmp completion
        -- on_attach = function(client, bufnr)
        --   -- Auto-format on save, if clangd supports it
        --   if client.supports_method("textDocument/formatting") then
        --     vim.api.nvim_create_autocmd("BufWritePre", {
        --       buffer = bufnr,
        --       callback = function()
        --         vim.lsp.buf.format({ bufnr = bufnr, async = false })
        --       end,
        --     })
        --   end
        -- end,
      }
      lspconfig.cssls.setup({
        capabilities = capabilities,
        cmd = { "vscode-css-language-server", "--stdio" },
        settings = {
          scss = {
            lint = {
              idSelector = "warning",
            },
          },
        },
      })
    end
  },
}
