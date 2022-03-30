local M = {}

function M.config()
	require("mini.cursorword").setup()
	-- highlighting
	local group = vim.api.nvim_create_augroup("CursorwordHighlight", { clear = true })
	local autocmd = vim.api.nvim_create_autocmd
	autocmd("VimEnter", {
		desc = "Cursorword",
		command = "hi MiniCursorword cterm=underline gui=underline guibg=#362639",
		group = group,
	})
	autocmd("VimEnter", {
		desc = "current Cursorword",
		command = "hi MiniCursorwordCurrent guibg=#362639",
		group = group,
	})
end

return M
