-- Shortcut for setting keymaps
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- ╭────────────────────────────╮
-- │ Navigation and window keys │
-- ╰────────────────────────────╯

-- Move between splits using Ctrl + arrow keys
map("n", "<C-h>", "<C-w>h", opts) -- left
map("n", "<C-j>", "<C-w>j", opts) -- down
map("n", "<C-k>", "<C-w>k", opts) -- up
map("n", "<C-l>", "<C-w>l", opts) -- right

-- Quickly split windows
map("n", "<leader>sh", ":split<CR>", opts)     -- horizontal split
map("n", "<leader>sv", ":vsplit<CR>", opts)    -- vertical split

-- Resize splits with Ctrl + arrow keys
map("n", "<C-Up>", ":resize -2<CR>", opts)
map("n", "<C-Down>", ":resize +2<CR>", opts)
map("n", "<C-Left>", ":vertical resize -2<CR>", opts)
map("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate between buffers
map("n", "<S-l>", ":bnext<CR>", opts)      -- next buffer
map("n", "<S-h>", ":bprevious<CR>", opts)  -- previous buffer

-- ╭────────────────────╮
-- │ File operations    │
-- ╰────────────────────╯

map("n", "<leader>w", ":w<CR>", opts)       -- Save file
map("n", "<leader>q", ":q<CR>", opts)       -- Quit window
map("n", "<leader>bd", ":bd<CR>", opts)     -- Close current buffer

-- ╭────────────────────╮
-- │ Editing helpers    │
-- ╰────────────────────╯

-- Move lines up/down in normal mode
map("n", "<A-j>", ":m .+1<CR>==", opts)
map("n", "<A-k>", ":m .-2<CR>==", opts)

-- Move selected lines up/down in visual mode
map("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
map("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)

-- Stay in visual mode when indenting
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- Quickly exit insert mode with jk
map("i", "jk", "<ESC>", opts)

-- Paste over selection without yanking it
map("v", "p", '"_dP', opts)
