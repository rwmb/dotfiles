return {
    'nvim-lualine/lualine.nvim',
    config = function()
      local opts = {
        options = {
          theme = 'catppuccin',
          icons_enabled = true,
        },
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = { 'branch', 'diff', 'diagnostics' },
          lualine_c = { 'filename' },
          lualine_x = { 'lsp_status', 'encoding', 'filetype'},
          lualine_y = { 'progress' },
          lualine_z = { 'location' },
        }
      }
      require("lualine").setup(opts)
    end
}

