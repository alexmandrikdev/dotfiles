return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function()
    local wk = require("which-key")

    wk.setup({
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
        border = "rounded",   -- only valid key as of now
      },
      layout = {
        spacing = 6,
        align = "left",
      },
    })

    -- Register top-level leader groups using new spec
    wk.register({
      { "<leader>c", group = "code actions" },
      { "<leader>d", group = "diagnostics" },
      { "<leader>f", group = "file" },
      { "<leader>g", group = "git" },
      { "<leader>r", group = "refactor/rename" },
      { "<leader>w", group = "workspace" },
    })
  end,
}
