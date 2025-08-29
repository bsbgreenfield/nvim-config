return {
	"sainnhe/sonokai",
	lazy = false,
	priority = 1000,
	config = function()
		-- Optionally configure and load the colorscheme
		-- directly inside the plugin declaration.
		vim.g.sonokai_enable_italic = false
		vim.g.sonokai_diagnostic_line_highlight = 1
		vim.g.sonokai_diagnostic_virtual_text = "colored"
		vim.g.sonokai_style = "atlantis"
		vim.cmd.colorscheme("sonokai")
	end,
}
