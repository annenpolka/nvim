local M = {}

function M.config()
	vim.g.yoinkMaxItems = 20
	vim.g.yoinkAutoFormatPaste = 1
end

function M.map()
	vim.g.yoinkAutoFormatPaste = 1
	nmap("p", "<Plug>(YoinkPaste_p)", "silent")
	nmap("P", "<Plug>(YoinkPaste_P)", "silent")
	nmap("gp", "<Plug>(YoinkPaste_gp)", "silent")
	nmap("gP", "<Plug>(YoinkPaste_gP)", "silent")
	nmap("<leader>n", "<Plug>(YoinkPostPasteSwapBack)", "silent")
	nmap("<leader>N", "<Plug>(YoinkPostPasteSwapForward)", "silent")
	nmap("[y", "<Plug>(YoinkRotateBack)", "silent")
	nmap("]y", "<Plug>(YoinkRotateForward)", "silent")
end

return M
