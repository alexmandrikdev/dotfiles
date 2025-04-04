-- Set leader key early, must be before lazy.nvim
vim.g.mapleader = " "       -- Space as leader
vim.g.maplocalleader = ","  -- Local leader

local opt = vim.opt

-- Appearance & UI
opt.number = true             -- Show line numbers
opt.relativenumber = true     -- Relative line numbers for easier navigation
opt.cursorline = true         -- Highlight current line
opt.termguicolors = true      -- Enable 24-bit RGB colors
opt.signcolumn = "yes"        -- Always show sign column (e.g. git, diagnostics)
opt.colorcolumn = "100"       -- Highlight column 100 for code width hint
opt.scrolloff = 8             -- Minimal lines to keep above and below cursor
opt.sidescrolloff = 8         -- Same for horizontal scrolling
opt.wrap = false              -- Don't wrap long lines

-- Tabs & Indentation
opt.expandtab = true          -- Convert tabs to spaces
opt.shiftwidth = 2            -- Number of spaces per indent level
opt.tabstop = 2               -- Number of spaces a tab counts for
opt.smartindent = true        -- Smart autoindent based on filetype
opt.autoindent = true         -- Keep indentation from previous line

-- Searching
opt.ignorecase = true         -- Case-insensitive search...
opt.smartcase = true          -- ... unless there's a capital letter
opt.incsearch = true          -- Show match while typing
opt.hlsearch = false           -- Highlight matches

-- Clipboard
opt.clipboard = "unnamedplus" -- Use system clipboard

-- Mouse
opt.mouse = "a"               -- Enable mouse in all modes

-- Splits
opt.splitright = true         -- Vertical splits open to the right
opt.splitbelow = true         -- Horizontal splits open below

-- Undo & Backup
opt.undofile = true           -- Persistent undo
opt.backup = false            -- Don't create backup files
opt.writebackup = false       -- Don't write backup before overwriting
opt.swapfile = false          -- Don't use swap files

-- File handling
opt.encoding = "utf-8"        -- Default encoding
opt.fileencoding = "utf-8"    -- File encoding

-- Command line & Messages
opt.cmdheight = 1             -- Height of command line
opt.updatetime = 300          -- Time before CursorHold events (used by LSP, etc.)
opt.timeoutlen = 400          -- Time to wait for a mapped sequence to complete

-- Completion
opt.completeopt = { "menu", "menuone", "noselect" } -- Completion options for cmp

