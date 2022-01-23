local M = {}

function M.config()
	vim.cmd([[
		augroup illuminate_augroup
			autocmd!
			autocmd VimEnter * hi illuminatedWord cterm=underline gui=underline guibg=NONE
			autocmd VimEnter * hi illuminatedCurWord guibg=#16162D
		augroup END
	]])
end

return M
