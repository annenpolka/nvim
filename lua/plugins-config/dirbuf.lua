local M = {}

function M.config()
	require("dirbuf").setup({
		hash_padding = 4,
		sort_order = "directories_first",
	})
end

function M.map()
	nmap("<C-u>", "<Plug>(dirbuf_up)", { ft = "dirbuf" })
	nmap("<C-s>", "<Cmd>DirbufSync<CR>", { ft = "dirbuf" })
end

return M
