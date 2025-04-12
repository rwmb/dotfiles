-- lua/config/plugins/mini.lua
return {
  {
    'echasnovski/mini.nvim',
    version = '*',
    config = function()
      require('mini.pairs').setup()
      require('mini.move').setup()
      require('mini.icons').setup()
      require('mini.surround').setup()
      require('mini.ai').setup()
      require('mini.comment').setup()
      require('mini.splitjoin').setup()
      require('mini.statusline').setup({
        use_icons = true
      })
      require('mini.diff').setup({
        view = {
          style = 'sign',
          signs = {
            add = '▌',
            change = '▌',
            delete = '▌'
          }
        }
      })
    end,
  },
}
