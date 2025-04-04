-- lua/plugins/autopairs.lua

return {
  "windwp/nvim-autopairs",
  event = "InsertEnter", -- Load only when entering insert mode
  config = function()
    local autopairs = require("nvim-autopairs")

    autopairs.setup({
      check_ts = true,            -- Enable Treesitter integration (for smarter pairing)
      disable_filetype = { "TelescopePrompt", "vim" }, -- Disable in specific filetypes
      fast_wrap = {
        map = "<M-e>",            -- Alt+e to wrap existing text in pairs
        chars = { "{", "[", "(", '"', "'" },
        pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
        offset = 0,               -- Offset from cursor position
        end_key = "$",
        keys = "qwertyuiopzxcvbnmasdfghjkl",
        check_comma = true,
        highlight = "Search",
        highlight_grey = "Comment",
      },
    })

    -- Optional: integrate with nvim-cmp (completion engine)
    -- TODO: Uncomment this when nvim-cmp is installed
 -- local cmp_status_ok, cmp = pcall(require, "cmp")
 -- if cmp_status_ok then
 --   local cmp_autopairs = require("nvim-autopairs.completion.cmp")
 --   cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
 -- end
  end,
}

