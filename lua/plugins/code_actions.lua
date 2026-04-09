return {
	"aznhe21/actions-preview.nvim",
	config = function()
		vim.keymap.set("n", "*", require("actions-preview").code_actions)
		require("actions-preview").setup({
			backend = { "telescope" },
		})
	end,
}
