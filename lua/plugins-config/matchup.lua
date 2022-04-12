local M = {}

function M.config()
	vim.g.matchup_matchparen_deferred = 1
	vim.g.matchup_matchparen_deferred_show_delay = 50
	vim.g.matchup_matchparen_deferred_hide_delay = 100
	vim.g.matchup_matchparen_hi_surround_always = 100
	vim.g.matchup_matchparen_timeout = 100
	vim.g.matchup_matchparen_insert_timeout = 30
end

return M
