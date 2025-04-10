-- lua/config/plugins/mini.lua
return {
  {
    'echasnovski/mini.nvim',
    config = function()
      local statusline = require 'mini.statusline'
      statusline.setup { use_icons = true }
      local diff = require 'mini.diff'
      diff.setup { view = { style = 'sign', signs = { add = '▌', change = '▌', delete = '▌' } } }
    end
  }
}

