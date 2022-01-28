local M = {}

function M.map()
	vnoremap("<leader>/", [[:lua require("comment-box").cbox()<CR>]])
end

return M
