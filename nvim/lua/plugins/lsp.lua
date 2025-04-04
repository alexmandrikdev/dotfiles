return {
  -- 1. LSPConfig: base Neovim LSP client configuration
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- 2. Mason: UI for installing LSPs and tools
      {
        "williamboman/mason.nvim",
        build = ":MasonUpdate",
        config = true, -- automatically runs require("mason").setup()
      },
      -- 3. Mason-LSPConfig: bridge between mason and lspconfig
      {
        "williamboman/mason-lspconfig.nvim",
        config = function()
          require("mason-lspconfig").setup({
            ensure_installed = {
              -- Languages you requested
              "lua_ls",
              "ts_ls",
              "html",
              "cssls",
              "tailwindcss",
              "jsonls",
              "yamlls",
              "intelephense",
              "solargraph",
              "marksman",
              "emmet_ls",
            },
            automatic_installation = true,
          })
        end,
      },
    },
    config = function()
      local lspconfig = require("lspconfig")

      -- Common on_attach function used for all servers
      local on_attach = function(_, bufnr)
        local map = function(mode, lhs, rhs, desc)
          vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
        end

        -- 📦 Common LSP keymaps
        map("n", "gd", vim.lsp.buf.definition, "Go to Definition")
        map("n", "gD", vim.lsp.buf.declaration, "Go to Declaration")
        map("n", "gi", vim.lsp.buf.implementation, "Go to Implementation")
        -- map("n", "gr", vim.lsp.buf.references, "Find References")
        map("n", "gr", "<cmd>Telescope lsp_references<cr>", "Find References")
        map("n", "K", vim.lsp.buf.hover, "Hover Documentation")
        map("n", "<leader>rn", vim.lsp.buf.rename, "Rename Symbol")
        map("n", "<leader>ca", vim.lsp.buf.code_action, "Code Action")
        map("n", "<leader>f", function() vim.lsp.buf.format({ async = true }) end, "Format Document")
        map("n", "<leader>ds", vim.lsp.buf.document_symbol, "Document Symbols")
        map("n", "<leader>ws", vim.lsp.buf.workspace_symbol, "Workspace Symbols")
        map("n", "<leader>dl", vim.diagnostic.setloclist, "Open Diagnostics List")
        map("n", "[d", vim.diagnostic.goto_prev, "Previous Diagnostic")
        map("n", "]d", vim.diagnostic.goto_next, "Next Diagnostic")
      end

      -- Server-specific configurations
      local servers = {
        lua_ls = {
          settings = {
            Lua = {
              workspace = { checkThirdParty = false },
              telemetry = { enable = false },
              diagnostics = {
                globals = { "vim" }, -- Prevent 'undefined global vim'
              },
            },
          },
        },
        ts_ls = {},
        html = {},
        cssls = {},
        tailwindcss = {},
        jsonls = {},
        yamlls = {},
        intelephense = {},
        solargraph = {},
        marksman = {},
        emmet_ls = {
          filetypes = {
            "html", "css", "javascript", "typescript",
            "javascriptreact", "typescriptreact",
            "blade", "php", "erb"
          },
        },
      }

      -- Initialize all configured LSP servers
      for name, config in pairs(servers) do
        lspconfig[name].setup(vim.tbl_deep_extend("force", {
          capabilities = vim.lsp.protocol.make_client_capabilities(),
          on_attach = on_attach,
        }, config))
      end
    end,
  },
}
