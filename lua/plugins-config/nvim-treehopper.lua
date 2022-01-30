local M = {}

function M.map()
	require("tsht").config.hint_keys = { "h", "j", "f", "d", "n", "v", "s", "l", "a" }
	omap("m", ":<C-U>lua require('tsht').nodes()<CR>", { silent = true })
	vnoremap("m", ":lua require('tsht').nodes()<CR>", { silent = true })
end

return M
