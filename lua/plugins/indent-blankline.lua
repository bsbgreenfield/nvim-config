return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	---@module "ibl"
	---@type ibl.config
	opts = {},
	config = function()
		local highlight = {
			"CursorColumn",
			"Whitespace",
		}
		require("ibl").setup({})
	end,
}
