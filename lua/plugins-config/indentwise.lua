local M = {}

function M.map()
	map(";", "<Plug>(IndentWiseNextLesserIndent)")
	map("+", "<Plug>(IndentWisePreviousGreaterIndent)")
	map(",", "<Plug>(IndentWiseNextGreaterIndent)")
	map("<C-z>", "<Plug>(IndentWisePreviousEqualIndent)")
	map("<C-x>", "<Plug>(IndentWiseNextEqualIndent)")
end
return M
