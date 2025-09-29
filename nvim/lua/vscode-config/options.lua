local opt = vim.opt

-- Searching
opt.ignorecase = true -- Case-insensitive search...
opt.smartcase = true  -- ... unless there's a capital letter
opt.incsearch = true  -- Show match while typing
opt.hlsearch = false  -- Highlight matches


-- Clipboard
opt.clipboard = "unnamedplus" -- Use system clipboard
