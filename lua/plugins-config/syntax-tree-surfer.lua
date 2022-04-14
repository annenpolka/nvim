local M = {}

function M.map()
	-- NAVIGATION: Only change the keymap to your liking. I would not recommend changing anything about the .surf() parameters!
	vim.keymap.set(
		"x",
		"J",
		'<cmd>lua require("syntax-tree-surfer").surf("next", "visual")<cr>',
		{ noremap = true, silent = true }
	)
	vim.keymap.set(
		"x",
		"K",
		'<cmd>lua require("syntax-tree-surfer").surf("prev", "visual")<cr>',
		{ noremap = true, silent = true }
	)
	vim.keymap.set(
		"x",
		"H",
		'<cmd>lua require("syntax-tree-surfer").surf("parent", "visual")<cr>',
		{ noremap = true, silent = true }
	)
	vim.keymap.set(
		"x",
		"L",
		'<cmd>lua require("syntax-tree-surfer").surf("child", "visual")<cr>',
		{ noremap = true, silent = true }
	)
end

return M
