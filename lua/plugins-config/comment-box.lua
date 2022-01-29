local M = {}

function M.map()
	nnoremap("<leader>/", [[:lua require("comment-box").cbox()<CR>]])
	vnoremap("<leader>/", [[:lua require("comment-box").cbox()<CR>]])
end

return M
