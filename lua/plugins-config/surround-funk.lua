local M = {}

function M.map()
	vim.g.surround_funk_create_mappings = 0
	nmap("dsf", "<Plug>(DeleteSurroundingFunction)", "silent")
	nmap("dsF", "<Plug>(DeleteSurroundingFUNCTION)", "silent")
	nmap("csf", "<Plug>(ChangeSurroundingFunction)", "silent")
	nmap("csF", "<Plug>(ChangeSurroundingFUNCTION)", "silent")
	nmap("ysf", "<Plug>(YankSurroundingFunction)", "silent")
	nmap("ysF", "<Plug>(YankSurroundingFUNCTION)", "silent")

	nmap("g(", "<Plug>(SwitchToParens)", "silent")
	nmap("g{", "<Plug>(SwitchToCurlyBraces)", "silent")
	nmap("g[", "<Plug>(SwitchToSquareBrackets)", "silent")

	xmap("if", "<Plug>(SelectWholeFunction)", "silent")
	omap("if", "<Plug>(SelectWholeFunction)", "silent")
	xmap("af", "<Plug>(SelectWholeFUNCTION)", "silent")
	omap("af", "<Plug>(SelectWholeFUNCTION)", "silent")
	xmap("in", "<Plug>(SelectFunctionName)", "silent")
	omap("in", "<Plug>(SelectFunctionName)", "silent")
	xmap("an", "<Plug>(SelectFunctionNAME)", "silent")
	omap("an", "<Plug>(SelectFunctionNAME)", "silent")

	vmap("gs", "<Plug>(GripSurroundObject)", "silent")
	nmap("gs", "<Plug>(GripSurroundObject)", "silent")
	nmap("gS", "<Plug>(GripSurroundObjectNoPaste)", "silent")
	vmap("gS", "<Plug>(GripSurroundObjectNoPaste)", "silent")
end
return M
