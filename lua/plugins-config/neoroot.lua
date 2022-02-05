local M = {}

function M.map()
	nnoremap("<F2>", ":NeoRootSwitchMode<CR>", { silent = true, nowait = true })
end

return M
