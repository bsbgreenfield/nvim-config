local opt = vim.opt
opt.termguicolors = true
vim.cmd("let g:netrw_liststyle = 3")
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
opt.relativenumber = false
opt.number = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.autoindent = true
vim.opt.number = true
vim.opt.showtabline = 2
opt.ignorecase = true
opt.smartcase = true
opt.statusline = " %<%f%= [%1*%M%*%n%R%H] %-19(%3l,%02c%03V%)%O'%02b'"

opt.pumheight = 8
opt.cursorline = true
opt.signcolumn = "yes"

opt.clipboard:append("unnamed,unnamedplus")

opt.splitright = true
opt.splitbelow = true

opt.swapfile = false

vim.diagnostic.config({
	virtual_text = {
		severity = { vim.diagnostic.severity.HINT, vim.diagnostic.severity.ERROR },
	},
	underline = true,
})
