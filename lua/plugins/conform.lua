return {
	"stevearc/conform.nvim",
	opts = {},
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				rust = { "rustfmt", lsp_format = "fallback" },
				javascript = { "prettierd", "prettier", stop_after_first = true },
				typescript = { "prettierd", "prettier", stop_after_first = true },
				typescriptreact = { "prettierd", lsp_format = "fallback" },
				zig = { "zigfmt", lsp_format = "fallback" },
				css = { "prettierd", "prettier", stop_after_first = true },
			},
		})
		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = "*",
			callback = function(args)
				require("conform").format({ bufnr = args.buf })
				--	if #(vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })) < 1 then
				--	end
			end,
		})
	end,
}
