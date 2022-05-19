local M = {}

function M.config()
	require("tsht").config.hint_keys = { "h", "j", "f", "d", "n", "v", "s", "l", "a" }
end
function M.map()
	omap("m", ":<C-U>lua require('tsht').nodes()<CR>", { silent = true })
	xnoremap("m", ":lua require('tsht').nodes()<CR>", { silent = true })
end

return M
