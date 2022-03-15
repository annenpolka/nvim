local M = {}

function M.config()
	vim.g.matchup_matchparen_deferred = 1
	vim.g.matchup_matchparen_deferred_show_delay = 100
	vim.g.matchup_matchparen_deferred_hide_delay = 500
	-- vim.g.matchup_matchparen_hi_surround_always = 1
end

return M
