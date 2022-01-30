local M = {}

function M.config()
	require("dirbuf").setup({
		hash_padding = 4,
	})
end

function M.map()
	nmap("<C-u>", "<Plug>(dirbuf_up)", { ft = "dirbuf" })
end

return M
