local M = {}

function M.config()
	-- toggle highlight by event
	vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI", "WinLeave" }, {
		callback = function()
			require("treesitter-unit").disable_highlighting("TSUnit")
		end,
	})
	vim.api.nvim_create_autocmd({ "CursorHold" }, {
		callback = function()
			require("treesitter-unit").enable_highlighting("TSUnit")
		end,
	})
	vim.cmd([[highlight TSUnit guibg=#35354A]])

	-- text objects
	vim.keymap.set("x", "iu", ':lua require"treesitter-unit".select()<CR>', { noremap = true })
	vim.keymap.set("x", "au", ':lua require"treesitter-unit".select(true)<CR>', { noremap = true })
	vim.keymap.set("o", "iu", ':<c-u>lua require"treesitter-unit".select()<CR>', { noremap = true })
	vim.keymap.set("o", "au", ':<c-u>lua require"treesitter-unit".select(true)<CR>', { noremap = true })
end

return M
