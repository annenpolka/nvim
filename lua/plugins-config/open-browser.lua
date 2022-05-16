local M = {}

function M.map()
	nmap("gx", "<Plug>(openbrowser-smart-search)")
	xmap("gx", "<Plug>(openbrowser-smart-search)")
end

return M
