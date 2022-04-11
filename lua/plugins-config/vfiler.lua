local M = {}
function M.config()
	-- TODO: create config 2-panes setting
end

function M.map()
	nnoremap(
		"<C-e>",
		":VFiler -auto-cd -keep -layout=left -width=30 -columns=indent,icon,name<CR>",
		{ noremap = true, silent = true }
	)
end
return M
