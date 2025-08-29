return {
	"https://github.com/neovim/nvim-lspconfig",
	config = function()
		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function(ev)
				vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { buffer = ev.buffer, silent = true })
				vim.keymap.set(
					"n",
					"<leader>D",
					"<cmd>Telescope diagnostics bufnr=0<CR>",
					{ buffer = ev.buffer, silent = true }
				)
			end,
		})
	end,
}
