local M = {}

function M.config()
	vim.cmd([[runtime macros/sandwich/keymap/surround.vim]])
end

function M.map()
	vim.api.nvim_set_keymap("x", "is", "<Plug>(textobj-sandwich-auto-i)", { noremap = false, silent = true })
	vim.api.nvim_set_keymap("x", "as", "<Plug>(textobj-sandwich-auto-a)", { noremap = false, silent = true })
	vim.api.nvim_set_keymap("o", "is", "<Plug>(textobj-sandwich-auto-i)", { noremap = false, silent = true })
	vim.api.nvim_set_keymap("o", "as", "<Plug>(textobj-sandwich-auto-a)", { noremap = false, silent = true })
end
return M
