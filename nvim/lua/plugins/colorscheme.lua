return {
  "catppuccin/nvim",
  name = "catppuccin",     -- Optional alias for referencing in other plugins
  priority = 1000,         -- Ensure this loads before all other plugins/themes
  lazy = false,            -- Load immediately (not lazily) on startup
  config = function()
    require("catppuccin").setup({
      flavour = "mocha",   -- Choose the theme variant: latte, frappe, macchiato, mocha (darkest)

      transparent_background = false, -- If true, disables setting background color

      integrations = {
        -- TODO: Add integrations
        notify = true,
      },
    })

    -- Apply the Catppuccin colorscheme
    vim.cmd.colorscheme("catppuccin")
  end,
}

