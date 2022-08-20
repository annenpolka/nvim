local M = {}

function M.config()
	local focus = require("focus")
	-- vim.wo.signcolumn = "number" -- set before focus loaded
	focus.setup({
		excluded_filetypes = { "toggleterm", "harpoon", "ctrlspace", "TelescopePrompt", "ddu-ff", "ddu-ff-filter" },
		excluded_buftypes = { "acwrite", "prompt", "nofile", "terminal" },
		winhighlight = true,
		hybridnumber = false,
		signcolumn = "number", -- set before focus loaded
	})
	vim.cmd([[
    hi link UnfocusedWindow CursorLine
    hi link focusedWindow VisualNC
	]])
end

function M.map()
	nnoremap("<leader>wh", ":FocusSplitLeft<CR>", { silent = true })
	nnoremap("<leader>wj", ":FocusSplitDown<CR>", { silent = true })
	nnoremap("<leader>wk", ":FocusSplitUp<CR>", { silent = true })
	nnoremap("<leader>wl", ":FocusSplitRight<CR>", { silent = true })
	nnoremap("<CR>", ":FocusMaxOrEqual<CR>", { silent = true })
	nnoremap("<CR>", "<CR>", { ft = "vim" }) -- avoid overding vim's <CR> in commandline mode
end

return M
