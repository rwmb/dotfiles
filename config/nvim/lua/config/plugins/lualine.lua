return {
    'nvim-lualine/lualine.nvim',
    config = function()
      local opts = {
        options = {
          theme = 'nordic',
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
        },
        on_colors = function(colors)
          colors.bg_statusline = "NONE"
        end,
      }
      require("lualine").setup(opts)
    end
}

