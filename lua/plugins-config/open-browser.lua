local M = {}

function M.map()
	nmap("gx", "<Plug>(openbrowser-smart-search)")
	vmap("gx", "<Plug>(openbrowser-smart-search)")
end

return M
