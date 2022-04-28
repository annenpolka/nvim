local M = {}

function M.config()
	local focus = require("focus")
	vim.wo.signcolumn = "number" -- set before focus loaded
	focus.setup({
		excluded_filetypes = { "toggleterm", "harpoon", "ctrlspace", "TelescopePrompt", "qf" },
		excluded_buftypes = { "acwrite", "prompt", "nofile", "terminal", "quickfix" },
		winhighlight = true,
		hybridnumber = false,
	})
	vim.cmd([[
    hi link UnfocusedWindow CursorLine
    hi link focusedWindow VisualNC
	]])
end

function M.map()
	nnoremap("<leader>h", ":FocusSplitLeft<CR>", { silent = true })
	nnoremap("<leader>j", ":FocusSplitDown<CR>", { silent = true })
	nnoremap("<leader>k", ":FocusSplitUp<CR>", { silent = true })
	nnoremap("<leader>l", ":FocusSplitRight<CR>", { silent = true })
	nnoremap("<CR>", ":FocusMaxOrEqual<CR>", { silent = true })
	nnoremap("<CR>", "<CR>", { ft = "vim" }) -- avoid overding vim's <CR> in commandline mode
end

return M
