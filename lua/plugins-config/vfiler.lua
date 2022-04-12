local M = {}
function M.config() end

function M.map()
	nnoremap(
		"<C-e>",
		":VFiler -auto-cd -keep -layout=left -width=30 -columns=indent,icon,name<CR>",
		{ noremap = true, silent = true }
	)
end
return M
