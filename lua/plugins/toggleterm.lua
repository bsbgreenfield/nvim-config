return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		require("toggleterm").setup({
			direction = "float",
			float_opts = {
				border = "single",
				width = 120,
				height = 50,
			},
		})
	end,
}
