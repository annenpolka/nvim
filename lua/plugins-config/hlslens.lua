local M = {}

function M.config()
	require("hlslens").setup({})
end

function M.map()
	local keymap = vim.keymap
	local hlslens = require("hlslens")
	keymap.set("n", "*", "", {
		callback = function()
			vim.fn.execute("normal! *N")
			hlslens.start()
		end,
	})
	keymap.set("n", "#", "", {
		callback = function()
			vim.fn.execute("normal! #N")
			hlslens.start()
		end,
	})
end

function M.map_with_vim_asterisk()
	vim.keymap.set("n", "n", [[n<Cmd>lua require('hlslens').start()<CR>zzzv]], { noremap = true, silent = true })
	vim.keymap.set("n", "N", [[N<Cmd>lua require('hlslens').start()<CR>zzzv]], { noremap = true, silent = true })
	vim.keymap.set(
		"n",
		"*",
		[[<Plug>(asterisk-*)<Cmd>lua require('hlslens').start()<CR>]],
		{ noremap = true, silent = true }
	)
	vim.keymap.set(
		"n",
		"#",
		[[<Plug>(asterisk-#)<Cmd>lua require('hlslens').start()<CR>]],
		{ noremap = true, silent = true }
	)
	vim.keymap.set(
		"n",
		"g*",
		[[<Plug>(asterisk-g*)<Cmd>lua require('hlslens').start()<CR>]],
		{ noremap = true, silent = true }
	)
	vim.keymap.set(
		"n",
		"g#",
		[[<Plug>(asterisk-g#)<Cmd>lua require('hlslens').start()<CR>]],
		{ noremap = true, silent = true }
	)
	-- no cursormove
	vim.keymap.set(
		"n",
		"z*",
		[[<Plug>(asterisk-z*)<Cmd>lua require('hlslens').start()<CR>]],
		{ noremap = true, silent = true }
	)
	vim.keymap.set(
		"n",
		"z#",
		[[<Plug>(asterisk-z#)<Cmd>lua require('hlslens').start()<CR>]],
		{ noremap = true, silent = true }
	)
	vim.keymap.set(
		"n",
		"gz*",
		[[<Plug>(asterisk-gz*)<Cmd>lua require('hlslens').start()<CR>]],
		{ noremap = true, silent = true }
	)
	vim.keymap.set(
		"n",
		"gz#",
		[[<Plug>(asterisk-gz#)<Cmd>lua require('hlslens').start()<CR>]],
		{ noremap = true, silent = true }
	)
end

return M
