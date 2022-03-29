local M = {}

function M.config()
	vim.g.bookmark_no_default_key_mappings = 1
	vim.g.bookmark_save_per_working_dir = 1
	vim.g.bookmark_auto_save = 1
	vim.g.bookmark_center = 1
	vim.g.bookmark_display_annotation = 1
end

function M.map()
	vim.keymap.set("n", "<C-b>", "<Plug>BookmarkToggle", { silent = true })
	-- vim.keymap.set("n", "<C-a>", "<Plug>BookmarkAnnotate", { silent = true })
	vim.keymap.set("n", "<leader>bb", "<Plug>BookmarkShowAll", { silent = true })
	vim.keymap.set("n", "<leader><Tab>", "<Plug>BookmarkNext", { silent = true })
	vim.keymap.set("n", "<leader><S-Tab>", "<Plug>BookmarkPrev", { silent = true })
	vim.keymap.set("n", "<leader>bc", "<Plug>BookmarkClear", { silent = true })
	vim.keymap.set("n", "<leader>bx", "<Plug>BookmarkClearAll", { silent = true })
end
return M
