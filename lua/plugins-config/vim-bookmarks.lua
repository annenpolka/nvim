local M = {}

function M.config()
	vim.g.bookmark_no_default_key_mappings = 1
	vim.g.bookmark_save_per_working_dir = 1
	vim.g.bookmark_auto_save = 1
	vim.g.bookmark_center = 1
end

function M.map()
	vim.api.nvim_set_keymap("n", "<C-m>", "<Plug>BookmarkToggle", { silent = true })
	vim.api.nvim_set_keymap("n", "<C-a>", "<Plug>BookmarkAnnotate", { silent = true })
	vim.api.nvim_set_keymap("n", "<leader>bb", "<Plug>BookmarkShowAll", { silent = true })
	vim.api.nvim_set_keymap("n", "<leader>bj", "<Plug>BookmarkNext", { silent = true })
	vim.api.nvim_set_keymap("n", "<leader>bk", "<Plug>BookmarkPrev", { silent = true })
	vim.api.nvim_set_keymap("n", "<leader>bc", "<Plug>BookmarkClear", { silent = true })
	vim.api.nvim_set_keymap("n", "<leader>bx", "<Plug>BookmarkClearAll", { silent = true })
end
return M
