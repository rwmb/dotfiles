-- lazy.nvim
return {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    -- add any options here
    messages = {
      view = "messages",
    }
  },
  dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
    }
}
