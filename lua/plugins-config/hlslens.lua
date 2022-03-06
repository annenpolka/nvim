local M = {}

function M.config()
	require("hlslens").setup({})
end

function M.map()
	vim.api.nvim_set_keymap(
		"n",
		"n",
		[[n<Cmd>lua require('hlslens').start()<CR>zzzv]],
		{ noremap = true, silent = true }
	)
	vim.api.nvim_set_keymap(
		"n",
		"N",
		[[N<Cmd>lua require('hlslens').start()<CR>zzzv]],
		{ noremap = true, silent = true }
	)
	vim.api.nvim_set_keymap(
		"n",
		"*",
		[[*<Cmd>lua require('hlslens').start()<CR>zzzv]],
		{ noremap = true, silent = true }
	)
	vim.api.nvim_set_keymap(
		"n",
		"#",
		[[#<Cmd>lua require('hlslens').start()<CR>zzzv]],
		{ noremap = true, silent = true }
	)
	vim.api.nvim_set_keymap(
		"n",
		"g*",
		[[g*<Cmd>lua require('hlslens').start()<CR>zzzv]],
		{ noremap = true, silent = true }
	)
	vim.api.nvim_set_keymap(
		"n",
		"g#",
		[[g#<Cmd>lua require('hlslens').start()<CR>zzzv]],
		{ noremap = true, silent = true }
	)
	vim.api.nvim_set_keymap("n", "<leader>L", ":nohl<CR>", { noremap = true, silent = true })
end

return M