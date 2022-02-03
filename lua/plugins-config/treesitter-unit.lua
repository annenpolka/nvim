local M = {}

function M.config()
	-- toggle highlight by event
	vim.cmd([[
	augroup AutoCursorline
	  autocmd!
	  autocmd CursorMoved,CursorMovedI,WinLeave * highlight clear ColorColumn
	  autocmd CursorHold,CursorHoldI * highlight ColorColumn guibg=#35354F
	augroup END
	]])
	vim.cmd([[highlight ColorColumn guibg=#35354A]])
	require("treesitter-unit").toggle_highlighting("ColorColumn")

	-- text objects
	vim.api.nvim_set_keymap("x", "iu", ':lua require"treesitter-unit".select()<CR>', { noremap = true })
	vim.api.nvim_set_keymap("x", "au", ':lua require"treesitter-unit".select(true)<CR>', { noremap = true })
	vim.api.nvim_set_keymap("o", "iu", ':<c-u>lua require"treesitter-unit".select()<CR>', { noremap = true })
	vim.api.nvim_set_keymap("o", "au", ':<c-u>lua require"treesitter-unit".select(true)<CR>', { noremap = true })
end

return M
