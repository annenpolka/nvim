local M = {}

function M.config()
	require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
end

function M.map()
	nnoremap("S", ":HopWord<CR>", "silent")
end

return M
