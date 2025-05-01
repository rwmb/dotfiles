return {
  {
    'williamboman/mason.nvim',
  },
  {
    'williamboman/mason-lspconfig.nvim',
    config = function()
      require('mason').setup()
      require('mason-lspconfig').setup({
      })
      local lspconfig = require('lspconfig')
      lspconfig.ts_ls.setup({})
      lspconfig.angularls.setup({})
    end
  },
  {
   'neovim/nvim-lspconfig',
  }
}
