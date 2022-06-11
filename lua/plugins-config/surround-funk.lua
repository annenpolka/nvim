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

	xmap("iF", "<Plug>(SelectWholeFunction)", "silent")
	omap("iF", "<Plug>(SelectWholeFunction)", "silent")
	xmap("aF", "<Plug>(SelectWholeFUNCTION)", "silent")
	omap("aF", "<Plug>(SelectWholeFUNCTION)", "silent")
	xmap("in", "<Plug>(SelectFunctionName)", "silent")
	omap("in", "<Plug>(SelectFunctionName)", "silent")
	xmap("an", "<Plug>(SelectFunctionNAME)", "silent")
	omap("an", "<Plug>(SelectFunctionNAME)", "silent")

	-- vmap("gs", "<Plug>(GripSurroundObject)", "silent")
	-- nmap("gs", "<Plug>(GripSurroundObject)", "silent")
	nmap("gs", "<Plug>(GripSurroundObjectNoPaste)", "silent")
	vmap("gs", "<Plug>(GripSurroundObjectNoPaste)", "silent")
end
return M
