local M = {}

function M.config()
	local focus = require("focus")
	-- vim.wo.signcolumn = "number" -- set before focus loaded
	focus.setup({
		autoresize = true,
		excluded_filetypes = {
			"toggleterm",
			"harpoon",
			"ctrlspace",
			"TelescopePrompt",
			"ddu-ff",
			"ddu-ff-filter",
			"OverseerList",
		},
		excluded_buftypes = { "acwrite", "prompt", "nofile", "terminal" },
		winhighlight = true,
		hybridnumber = false,
		signcolumn = "number",
	})
	vim.cmd([[
    hi link UnfocusedWindow CursorLine
    hi link focusedWindow VisualNC
	]])
end

function M.map()
	vim.keymap.set("n", "<leader>wh", ":FocusSplitLeft<CR>", { silent = true })
	vim.keymap.set("n", "<leader>wj", ":FocusSplitDown<CR>", { silent = true })
	vim.keymap.set("n", "<leader>wk", ":FocusSplitUp<CR>", { silent = true })
	vim.keymap.set("n", "<leader>wl", ":FocusSplitRight<CR>", { silent = true })
	vim.keymap.set("n", "<CR>", ":FocusMaxOrEqual<CR>", { silent = true })
	vim.keymap.set("n", "<CR>", "<CR>", { ft = "vim" }) -- avoid overding vim's <CR> in commandline mode
end

return M
