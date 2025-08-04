-- Formatter utilisés par fichier (cf lsp-config.lua pour l'installation auto)
return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "isort", "black" },
			java = { "google-java-format" },
			html = { "htmlbeautifier" },
			css = { {"prettierd", "prettier"} },
			scss = { {"prettierd", "prettier"} },
			javascript = { {"prettierd", "prettier"} },
			typescript = { {"prettierd", "prettier"} },
			json = { {"prettierd", "prettier"} },
			yaml = { {"prettierd", "prettier"} },
			markdown = { {"prettierd", "prettier"} },
		},
	},
	config = function(_, opts)
		require("conform").setup(opts)

		vim.keymap.set({"n", "v"}, "<C-M-l>", function()
			require("conform").format({
                lsp_fallback = true,
                async = false,
                -- timeout_ms = 500,
            })
		end, { desc = "Format with Conform" })
	end,
}
