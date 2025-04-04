return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter", -- Lazy load on insert
  dependencies = {
    -- Completion sources
    "hrsh7th/cmp-nvim-lsp",     -- LSP source
    "hrsh7th/cmp-buffer",       -- Buffer words
    "hrsh7th/cmp-path",         -- Filesystem paths
    "hrsh7th/cmp-cmdline",      -- :commands
    "saadparwaiz1/cmp_luasnip", -- LuaSnip source

    -- Snippet engine
    {
      "L3MON4D3/LuaSnip",
      build = "make install_jsregexp",                   -- Needed for some snippet features
      dependencies = { "rafamadriz/friendly-snippets" }, -- Prebuilt snippets
      config = function()
        require("luasnip.loaders.from_vscode").lazy_load()
      end,
    },
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-Space>"] = cmp.mapping.complete(),                 -- Trigger completion manually
        ["<CR>"]      = cmp.mapping.confirm({ select = true }), -- Confirm selection
        ["<Tab>"]     = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"]   = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
      }),
      formatting = {
        format = function(entry, vim_item)
          vim_item.menu = ({
            nvim_lsp = "[LSP]",
            luasnip  = "[Snippet]",
            buffer   = "[Buffer]",
            path     = "[Path]",
          })[entry.source.name]
          return vim_item
        end,
      },
    })
  end,
}
