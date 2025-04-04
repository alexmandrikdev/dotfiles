return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy", -- Load when Neovim is idle
  dependencies = { "nvim-tree/nvim-web-devicons" }, -- For file icons
  config = function()
    require("lualine").setup({
      options = {
        theme = "catppuccin",     -- Match your colorscheme
        section_separators = "",  -- Remove fancy separators
        component_separators = "",

        globalstatus = true,      -- Single statusline for entire Neovim window
        disabled_filetypes = {    -- Don't show in these types
          statusline = { "alpha", "dashboard", "NvimTree", "oil" },
          winbar = {},
        },
      },
      sections = {
        lualine_a = { "mode" },                        -- Current mode (e.g. NORMAL)
        lualine_b = { "branch", "diff", "diagnostics" }, -- Git branch, changes, LSP diagnostics
        lualine_c = { { "filename", path = 1 } },       -- File name (relative path)
        lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_y = { "progress" },                    -- Cursor position in %
        lualine_z = { "location" },                    -- Line/column position
      },
    })
  end,
}

