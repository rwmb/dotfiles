-- lua/config/plugins/mini.lua
return {
  {
    'echasnovski/mini.pairs',
    version = '*',
    config = function()
      require('mini.pairs').setup()
    end,
  },
  {
    'echasnovski/mini.move',
    version = '*',
    config = function()
      require('mini.move').setup()
    end,
  },
  {
    'echasnovski/mini.diff',
    version = '*',
    config = function()
      require('mini.diff').setup({
        view = {
          style = 'sign',
          signs = { add = '▌',
          change = '▌',
          delete = '▌'
        }
      }
    })
    end,
  },
  {
    'echasnovski/mini.statusline',
     version = '*',
    config = function()
      require('mini.statusline').setup({
        use_icons = true
      })
    end,
  },
}
