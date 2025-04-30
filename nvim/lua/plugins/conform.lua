return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" }, -- Format on save
	dependencies = { "williamboman/mason.nvim" },
	config = function()
		local conform = require("conform")

		conform.setup({
			format_on_save = {
				lsp_fallback = true, -- Use LSP formatting if no formatter is configured
				timeout_ms = 1000,
			},
			formatters_by_ft = {
				lua = { "stylua" },
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				html = { "prettier" },
				css = { "prettier" },
				scss = { "prettier" },
				markdown = { "prettier" },
				php = { "php-cs-fixer" },
				ruby = { "rubocop" },
				blade = { "blade-formatter" },
				erb = { "htmlbeautifier" },
			},
			formatters = {
				php_cs_fixer = {
					command = "php-cs-fixer",
					args = { "fix", "--quiet", "-" },
					stdin = true,
				},
			},
		})

		-- Ensure required formatters are installed via mason
		local formatters = {
			"stylua",
			"prettier",
			"php-cs-fixer",
			"rufo",
			"blade-formatter",
			"htmlbeautifier",
		}

		local mason_registry = require("mason-registry")
		for _, name in ipairs(formatters) do
			local ok, pkg = pcall(mason_registry.get_package, name)
			if ok and not pkg:is_installed() then
				pkg:install()
			end
		end
	end,
}
