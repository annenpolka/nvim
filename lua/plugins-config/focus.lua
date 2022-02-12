local M = {}

function M.config()
	local focus = require("focus")
	focus.setup({
		excluded_filetypes = { "toggleterm", "harpoon", "ctrlspace", "TelescopePrompt" },
		excluded_buftypes = { "acwrite" },
		winhighlight = true,
		hybridnumber = false,
	})
	vim.cmd([[
		augroup FocusWindowHighlight
			autocmd!
				autocmd VimEnter * hi link UnfocusedWindow CursorLine
		augroup END
	]])
end

function M.map()
	vim.api.nvim_set_keymap("n", "<leader>h", ":FocusSplitLeft<CR>", { silent = true })
	vim.api.nvim_set_keymap("n", "<leader>j", ":FocusSplitDown<CR>", { silent = true })
	vim.api.nvim_set_keymap("n", "<leader>k", ":FocusSplitUp<CR>", { silent = true })
	vim.api.nvim_set_keymap("n", "<leader>l", ":FocusSplitRight<CR>", { silent = true })
	vim.api.nvim_set_keymap("n", "<leader>a", ":FocusMaxOrEqual<CR>", { silent = true })
end

return M
