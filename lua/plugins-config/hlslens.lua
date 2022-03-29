local M = {}

function M.config()
	require("hlslens").setup({})
end

function M.map()
	vim.keymap.set(
		"n",
		"n",
		[[n<Cmd>lua require('hlslens').start()<CR>zzzv]],
		{ noremap = true, silent = true }
	)
	vim.keymap.set(
		"n",
		"N",
		[[N<Cmd>lua require('hlslens').start()<CR>zzzv]],
		{ noremap = true, silent = true }
	)
	vim.keymap.set(
		"n",
		"*",
		[[*<Cmd>lua require('hlslens').start()<CR>zzzv]],
		{ noremap = true, silent = true }
	)
	vim.keymap.set(
		"n",
		"#",
		[[#<Cmd>lua require('hlslens').start()<CR>zzzv]],
		{ noremap = true, silent = true }
	)
	vim.keymap.set(
		"n",
		"g*",
		[[g*<Cmd>lua require('hlslens').start()<CR>zzzv]],
		{ noremap = true, silent = true }
	)
	vim.keymap.set(
		"n",
		"g#",
		[[g#<Cmd>lua require('hlslens').start()<CR>zzzv]],
		{ noremap = true, silent = true }
	)
end

return M
