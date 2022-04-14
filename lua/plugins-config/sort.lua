local M = {}

function M.config()
	require("sort").setup({
		delimiters = {
			",",
			"|",
			";",
			":",
			"s", -- Space
			"t", -- Tab
		},
	})
end

function M.map()
	nnoremap("go", "<Cmd>Sort<CR>")
	vnoremap("go", "<Esc><Cmd>Sort<CR>")
end

return M
