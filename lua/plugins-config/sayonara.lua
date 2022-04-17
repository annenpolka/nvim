local M = {}

function M.map()
	nnoremap("<C-q>", "<Cmd>call undoquit#SaveWindowQuitHistory()<CR>:Sayonara<CR>", { silent = true })
	-- ╭──────────────────────────────────────────────────────────╮
	-- │           -- undoquit.vim's restore window/tab           │
	-- ╰──────────────────────────────────────────────────────────╯
	vim.g.undoquit_mapping = ""
	vim.g.undoquit_tab_mapping = ""
	nnoremap("<C-w>u", "<Cmd>Undoquit<CR><C-w>L", { silent = true })
end

return M
