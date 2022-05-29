local M = {}

function M.map()
	vim.g.sayonara_confirm_quit = true
	nnoremap("<C-q>", "<Cmd>call undoquit#SaveWindowQuitHistory()<CR>:Sayonara<CR>", { silent = true })
	-- ╭──────────────────────────────────────────────────────────╮
	-- │           -- undoquit.vim's restore window/tab           │
	-- ╰──────────────────────────────────────────────────────────╯
	vim.g.undoquit_mapping = ""
	vim.g.undoquit_tab_mapping = ""
	nnoremap("<C-w>u", "<Cmd>Undoquit<CR><C-w>L", { silent = true })
	nnoremap("<C-w><C-u>", "<Cmd>Undoquit<CR><C-w>L", { silent = true })
end

return M
