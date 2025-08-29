vim.g.mapleader = " "
local keymap = vim.keymap
keymap.set("i", "jk", "<Esc>")
keymap.set("i", "kj", "<Esc>")
keymap.set("n", "n", "i<Cr><Esc>")
-- keymap.set("i", "&^", "<End>") -- only works for alacritty!!!
keymap.set("n", "<S-Left>", "<C-w><Left>")
keymap.set("n", "<S-Right>", "<C-w><Right>")

local get_distance_to_close_delim = function()
	local row, col = unpack(vim.api.nvim_win_get_cursor(0))
	local line = vim.api.nvim_get_current_line()

	-- short-circuit on empty/whitespace-only lines
	if line:match("^%s*$") then
		return -1
	end

	local close_delims = { ")", "]", "}", '"', "'" }
	local open_delims = { "(", "[", "{", '"', "'" }
	for i = col + 1, #line do
		local char = line:sub(i, i)
		local delim_idx = -1
		-- get delim idx, if there is one
		for x = 1, #close_delims do
			if close_delims[x] == char then
				delim_idx = x
				break
			end
		end
		-- delim found, now loop backwards looking for open_delims[delim_idx]
		if delim_idx > -1 then
			for b = col, 1, -1 do
				b_char = line:sub(b, b)
				if b_char == open_delims[delim_idx] then
					return i - col
				end
			end
		end
	end
	-- reached the end of the line without finding a close delim
	return -1
end
vim.keymap.set("i", "<Tab>", function()
	local distance = get_distance_to_close_delim()
	if distance == -1 then
		return "<Tab>"
	else
		return string.rep("<Right>", distance)
	end
end, { expr = true, noremap = true })

-- windows
keymap.set("n", "<leader>wv", "<C-w>v")
keymap.set("n", "<leader>we", "<C-w>=")
keymap.set("n", "<leader>ww", "<cmd>close<CR>")
keymap.set("n", "<C-h>", "<C-w>h")
keymap.set("n", "<C-l>", "<C-w>l")
keymap.set("n", "<C-o>", "<cmd>Neotree toggle<CR>")
keymap.set("n", "<C-,>", "<C-w><2")
keymap.set("n", "<C-.>", "<C-w>>2")
keymap.set("n", "gp", "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", { noremap = true })

--buffers
keymap.set("n", "<leader>bd", "<cmd>bdelete<cr>")
keymap.set("n", "<C-]>", "<cmd>bnext<CR>")
keymap.set("n", "<C-[>", "<cmd>bprev<CR>")

-- commands
keymap.set("n", "<C-s>", "<cmd>w<CR>")
keymap.set("i", "<C-s>", "<cmd>w<CR>")

-- text
keymap.set("i", "<C-l>", "<Right>")
keymap.set("i", "<C-h>", "<Left>")
keymap.set("n", "<leader>h", "0")
keymap.set("i", "&%", "<Esc>ji")
keymap.set("n", "<S-u>", "o<Esc>")

-- visual
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")
keymap.set("v", "<leader>vc", "<cmd>noh<CR>")
keymap.set("n", "<leader>vc", "<cmd>noh<CR>")

-- telescope
local builtin = require("telescope.builtin")
keymap.set("n", "<leader>ff", builtin.find_files)
keymap.set("n", "<leader>fg", builtin.live_grep)
keymap.set("n", "<leader>bb", builtin.buffers, { desc = "Telescope buffers" })
