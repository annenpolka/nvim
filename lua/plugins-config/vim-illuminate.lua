local M = {}

function M.config()
	vim.g.Illuminate_delay = 300
	vim.cmd([[
		augroup illuminateAugroup
			autocmd!
			autocmd VimEnter * hi illuminatedWord cterm=underline gui=underline guibg=#362639
			autocmd VimEnter * hi illuminatedCurWord guibg=#362639
		augroup END
	]])
end

return M
