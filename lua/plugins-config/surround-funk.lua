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

	xmap("af", "<Plug>(SelectWholeFunction)", "silent")
	omap("af", "<Plug>(SelectWholeFunction)", "silent")
	xmap("aF", "<Plug>(SelectWholeFUNCTION)", "silent")
	omap("aF", "<Plug>(SelectWholeFUNCTION)", "silent")
	xmap("if", "<Plug>(SelectWholeFunction)", "silent")
	omap("if", "<Plug>(SelectWholeFunction)", "silent")
	xmap("iF", "<Plug>(SelectWholeFUNCTION)", "silent")
	omap("iF", "<Plug>(SelectWholeFUNCTION)", "silent")
	xmap("an", "<Plug>(SelectFunctionName)", "silent")
	omap("an", "<Plug>(SelectFunctionName)", "silent")
	xmap("aN", "<Plug>(SelectFunctionNAME)", "silent")
	omap("aN", "<Plug>(SelectFunctionNAME)", "silent")
	xmap("in", "<Plug>(SelectFunctionName)", "silent")
	omap("in", "<Plug>(SelectFunctionName)", "silent")
	xmap("iN", "<Plug>(SelectFunctionNAME)", "silent")
	omap("iN", "<Plug>(SelectFunctionNAME)", "silent")

	vmap("gs", "<Plug>(GripSurroundObject)", "silent")
	nmap("gs", "<Plug>(GripSurroundObject)", "silent")
	nmap("gS", "<Plug>(GripSurroundObjectNoPaste)", "silent")
	vmap("gS", "<Plug>(GripSurroundObjectNoPaste)", "silent")
end
return M
