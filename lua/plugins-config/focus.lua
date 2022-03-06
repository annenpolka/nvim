local M = {}

function M.config()
	local focus = require("focus")
	focus.setup({
		excluded_filetypes = { "toggleterm", "harpoon", "ctrlspace", "TelescopePrompt" },
		excluded_buftypes = { "acwrite", "prompt" },
		winhighlight = true,
		hybridnumber = false,
	})
	vim.cmd([[
    hi link UnfocusedWindow CursorLine
    hi link focusedWindow VisualNC
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
