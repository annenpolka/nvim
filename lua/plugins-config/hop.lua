local M = {}

function M.config()
	require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
end

function M.map()
	-- nnoremap("S", ":HopWord<CR>", "silent")
	nnoremap("H", ":HopWordBC<CR>", "silent")
	nnoremap("L", ":HopWordAC<CR>", "silent")
end

return M
