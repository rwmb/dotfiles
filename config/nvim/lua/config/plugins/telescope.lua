-- plugins/telescope.lua:
return {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
      dependencies = {
        'nvim-lua/plenary.nvim',
      },
      config = function()
        local opts = {}
        opts.defaults = {
          mappings = {
            i = {
              ["<C-u>"] = false
            }
          }
        }

        opts.pickers = {
            find_files = {
              follow = true,
              file_ignore_patterns = {
                "node_modules/",
              }
            },
            live_grep = {
              follow = true,
              file_ignore_patterns = {
                "node_modules/",
                "package-lock.json",
              }
            },
          }

        require('telescope').setup(opts)

        vim.keymap.set("n", "<Leader>ff", require('telescope.builtin').find_files)
        vim.keymap.set("n", "<Leader>fg", require('telescope.builtin').live_grep)
        vim.keymap.set("n", "<Leader>fa", function()
          require('telescope.builtin').find_files {}
        end)
        vim.keymap.set("n", "<Leader>fc", function()
          require('telescope.builtin').find_files {
            cwd = "~/.config"
          }
        end)
      end
}
