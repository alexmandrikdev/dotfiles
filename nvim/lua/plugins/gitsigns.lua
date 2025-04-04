return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" }, -- Lazy load when opening a file
  config = function()
    require("gitsigns").setup({
      signs = {
        add          = { text = "│" },
        change       = { text = "│" },
        delete       = { text = "󰍵" },
        topdelete    = { text = "‾" },
        changedelete = { text = "~" },
        untracked    = { text = "┆" },
      },
      signcolumn = true,         -- Show git signs in the sign column
      numhl      = false,        -- Disable number highlight
      linehl     = false,        -- Disable line highlight
      word_diff  = false,        -- Disable word-level diff in change

      watch_gitdir = {
        interval = 1000,         -- How often to poll for changes
        follow_files = true,
      },

      attach_to_untracked = true, -- Also show signs for untracked files
      current_line_blame = true, -- Enable later if you want inline git blame
      update_debounce = 200,      -- Delay before update when typing

      preview_config = {
        border = "rounded",
        style = "minimal",
        relative = "cursor",
        row = 0,
        col = 1,
      },

      -- Optional keymaps (only load if you want)
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, desc)
          vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
        end

        map("n", "]c", gs.next_hunk, "Next Git Hunk")
        map("n", "[c", gs.prev_hunk, "Previous Git Hunk")
        map("n", "<leader>gp", gs.preview_hunk, "Preview Git Hunk")
        map("n", "<leader>gs", gs.stage_hunk, "Stage Git Hunk")
        map("n", "<leader>gu", gs.undo_stage_hunk, "Undo Stage Hunk")
        map("n", "<leader>gr", gs.reset_hunk, "Reset Git Hunk")
        map("n", "<leader>gR", gs.reset_buffer, "Reset Git Buffer")
      end,
    })
  end,
}

