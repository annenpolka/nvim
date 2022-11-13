local M = {}

function M.map()
	nnoremap("<leader>wd", ":NeoRootSwitchMode<CR>", { silent = true, nowait = true })
end

return M
