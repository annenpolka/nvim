local M = {}

function M.config()
	local focus = require("focus")
	vim.wo.signcolumn = "number" -- set before focus loaded
	focus.setup({
		excluded_filetypes = { "toggleterm", "harpoon", "ctrlspace", "TelescopePrompt" },
		excluded_buftypes = { "acwrite", "prompt", "nofile", "terminal" },
		winhighlight = true,
		hybridnumber = false,
	})
	vim.cmd([[
    hi link UnfocusedWindow CursorLine
    hi link focusedWindow VisualNC
	]])
end

function M.map()
	vim.keymap.set("n", "<leader>h", ":FocusSplitLeft<CR>", { silent = true })
	vim.keymap.set("n", "<leader>j", ":FocusSplitDown<CR>", { silent = true })
	vim.keymap.set("n", "<leader>k", ":FocusSplitUp<CR>", { silent = true })
	vim.keymap.set("n", "<leader>l", ":FocusSplitRight<CR>", { silent = true })
	vim.keymap.set("n", "<leader>a", ":FocusMaxOrEqual<CR>", { silent = true })
end

return M
