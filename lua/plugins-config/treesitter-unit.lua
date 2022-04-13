local M = {}

function M.config()
	-- toggle highlight by event
	vim.cmd([[
	augroup AutoUnitHighlight
	  autocmd!
	  autocmd CursorMoved,CursorMovedI,WinLeave * highlight clear ColorColumn
	  autocmd CursorHold * highlight ColorColumn guibg=#35354A
	augroup END
	]])
	vim.cmd([[highlight ColorColumn guibg=#35354A]])
	require("treesitter-unit").toggle_highlighting("ColorColumn")

	-- text objects
	vim.keymap.set("x", "iu", ':lua require"treesitter-unit".select()<CR>', { noremap = true })
	vim.keymap.set("x", "au", ':lua require"treesitter-unit".select(true)<CR>', { noremap = true })
	vim.keymap.set("o", "iu", ':<c-u>lua require"treesitter-unit".select()<CR>', { noremap = true })
	vim.keymap.set("o", "au", ':<c-u>lua require"treesitter-unit".select(true)<CR>', { noremap = true })
end

return M
