return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function()
    local wk = require("which-key")

    wk.setup({
      delay = 500,
      plugins = {
        marks = true,
        registers = true,
        spelling = {
          enabled = true,
          suggestions = 20,
        },
      },
      replace = {
        ["<leader>"] = "␣",
      },
      filter = function(key)
        return key.desc ~= nil
      end,
      win = {
        border = "rounded", -- only valid key as of now
      },
      layout = {
        spacing = 6,
        align = "left",
      },
    })
  end,
}
