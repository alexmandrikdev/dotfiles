return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",     -- Ensure parsers are up-to-date after install
  event = { "BufReadPost", "BufNewFile" },  -- Load Treesitter only when editing files
  config = function()
    require("nvim-treesitter.configs").setup({
      -- List of parsers to install
      ensure_installed = {
        "bash",
        "css",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "php",
        "ruby",
        "tsx",
        "typescript",
        "vim",
        "yaml",
      },

      sync_install = false,    -- Don't block Neovim while installing
      auto_install = true,     -- Auto-install missing parsers on buffer open

      highlight = {
        enable = true,         -- Enable Treesitter-based syntax highlighting
        additional_vim_regex_highlighting = false, -- Disable regex highlighting (faster)
      },

      indent = {
        enable = true,         -- Enable smart indentation (not perfect for all langs)
      },

      autopairs = {
        enable = true,         -- Auto close brackets/parens if using nvim-autopairs
      },
    })
  end,
}

