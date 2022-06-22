local M = {}

function M.config()
	-- set vim-surround style mapping
	vim.cmd([[runtime macros/sandwich/keymap/surround.vim]])
end

function M.map()
	vim.g.sandwich_no_default_key_mappings = 1
	vim.keymap.set("x", "is", "<Plug>(textobj-sandwich-auto-i)", { noremap = false, silent = true })
	vim.keymap.set("x", "as", "<Plug>(textobj-sandwich-auto-a)", { noremap = false, silent = true })
	vim.keymap.set("o", "is", "<Plug>(textobj-sandwich-auto-i)", { noremap = false, silent = true })
	vim.keymap.set("o", "as", "<Plug>(textobj-sandwich-auto-a)", { noremap = false, silent = true })
end
return M
