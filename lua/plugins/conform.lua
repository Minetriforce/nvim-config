-- Formatter utilisés par fichier (cf lsp-config.lua pour l'installation auto)
return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "isort", "black" },
            c = { "clang-format" },
			java = { "google-java-format" },
			html = { "htmlbeautifier" },
			css = {  "prettierd", "prettier", stop_after_first = true },
			scss = { "prettierd", "prettier", stop_after_first = true },
			javascript = {  "prettierd", "prettier", stop_after_first = true },
			typescript = { "prettierd", "prettier", stop_after_first = true },
			json = { "prettierd", "prettier", stop_after_first = true },
			yaml = { "prettierd", "prettier", stop_after_first = true },
			markdown = { "prettierd", "prettier", stop_after_first = true },
		},
		-- Format automatique à la sauvegarde (optionnel)
		-- format_on_save = {
		-- 	timeout_ms = 500,
		-- 	lsp_fallback = true,
		-- },
	},
	config = function(_, opts)
		require("conform").setup(opts) -- charger les options

		vim.keymap.set({ "n", "v" }, "<C-M-l>", function()
			require("conform").format({
				lsp_fallback = true,
				async = false,
				-- timeout_ms = 500,
			})
		end, { desc = "Format with Conform" })
	end,
}
