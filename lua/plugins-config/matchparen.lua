local M = {}

function M.config()
	require("matchparen").setup({
		on_startup = true, -- Should it be enabled by default
		hl_group = "MatchParen", -- highlight group for matched characters
		augroup_name = "matchparen", -- almost no reason to touch this unless
	})
end

return M
