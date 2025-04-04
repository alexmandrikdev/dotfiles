return {
  "rcarriga/nvim-notify",
  lazy = false,               -- Load on startup so it's used as the default notify
  priority = 1000,            -- Load early to override vim.notify immediately
  config = function()
    local notify = require("notify")

    notify.setup({
      -- Display style: compact, simple, or minimal
      stages = "fade_in_slide_out",  -- Smooth animation for appearance/disappearance

      timeout = 3000,                -- Time (ms) before notification disappears
      minimum_width = 50,            -- Minimum width of notification window
      max_width = 80,                -- Maximum width
      top_down = true,              -- Show newest notifications on top

      -- Icons for different message levels (optional override)
      icons = {
        ERROR = "",
        WARN  = "",
        INFO  = "",
        DEBUG = "",
        TRACE = "✎",
      },

      render = "default",            -- Can also use "compact", "minimal", etc.
      background_colour = "#000000", -- Only needed if transparency is enabled
    })

    -- Replace default vim.notify with nvim-notify
    vim.notify = notify
  end,
}

