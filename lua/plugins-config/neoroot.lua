local M = {}

function M.map()
	nnoremap("<C-l>", ":NeoRootSwitchMode<CR>", { silent = true, nowait = true })
end

return M
