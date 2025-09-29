return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			json = { "jq" },
			jsonc = { "jq" },
			css = { "prettierd", "prettier", stop_after_first = true },
			--javascript = { "prettierd", "prettier", stop_after_first = true },
			--nginx = { "nginxfmt", lsp_format = "fallback" },
		},
		format_on_save = {
			timeout_ms = 500,
			lsp_fallback = true,
		},
	},
}
