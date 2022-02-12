local M = {}

function M.config()
	require("yode-nvim").setup()
end

function M.map()
	nmap("<C-y>", "vai:YodeCreateSeditorFloating<CR>")
	xmap("<C-y>", ":YodeCreateSeditorFloating<CR>")
	xmap("<leader>yr", ":YodeCreateSeditorReplace<CR>")
end

return M
