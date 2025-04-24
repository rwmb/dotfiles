return {
    'AlexvZyl/nordic.nvim',
    lazy = false,
    priority = 1000,
    config = function()
        require('nordic').setup({
          transparent = {
          -- Enable transparent background.
            bg = true,
            -- Enable transparent background for floating windows.
            float = true,
          },
          cursorline = {
          -- Bold font in cursorline.
            bold = true,
            -- Bold cursorline number.
            bold_number = true,
            -- Available styles: 'dark', 'light'.
            theme = 'light',
            -- Blending the cursorline bg with the buffer bg.
            blend = 0.85,
          },
        })
    end
}
