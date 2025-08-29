return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")
		configs.setup({
			modules = {},
			ignore_install = {},
			auto_install = true,
			sync_install = false,
			ensure_installed = {
				"c",
				"lua",
				"vim",
				"rust",
				"wgsl",
				"zig",
				"regex",
				"bash",
				"markdown",
				"markdown_inline",
				"typescript",
				"tsx",
			},
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
