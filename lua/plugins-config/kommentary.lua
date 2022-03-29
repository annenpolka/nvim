local M = {}

function M.config()
	require("kommentary.config").configure_language("default", {
		prefer_single_line_comments = true,
	})
end

function M.map()
	vim.keymap.set("n", "<leader>cic", "<Plug>kommentary_line_increase", {})
	vim.keymap.set("n", "<leader>ci", "<Plug>kommentary_motion_increase", {})
	vim.keymap.set("x", "<leader>ci", "<Plug>kommentary_visual_increase", {})
	vim.keymap.set("n", "<leader>cdc", "<Plug>kommentary_line_decrease", {})
	vim.keymap.set("n", "<leader>cd", "<Plug>kommentary_motion_decrease", {})
	vim.keymap.set("x", "<leader>cd", "<Plug>kommentary_visual_decrease", {})
	vim.keymap.set("n", "<C-_>", "<Plug>kommentary_line_default", {})
	vim.keymap.set("v", "<C-_>", "<Plug>kommentary_visual_default<C-c>", {})
end

return M