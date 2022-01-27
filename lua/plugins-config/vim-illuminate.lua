local M = {}

function M.config()
	vim.g.Illuminate_delay = 300
	vim.cmd([[
		augroup illuminate_augroup
			autocmd!
			autocmd VimEnter * hi illuminatedWord cterm=underline gui=underline guibg=#16162D
			autocmd VimEnter * hi illuminatedCurWord guibg=#16162D
		augroup END
	]])
end

return M
