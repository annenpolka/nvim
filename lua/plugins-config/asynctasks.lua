local M = {}

function M.config()
	-- open quickfix automatically
	vim.g.asyncrun_open = 6
	-- task config file path
	vim.g.asynctasks_extra_config = {
		vim.fn.stdpath("config") .. "/tasks.ini",
	}
end

return M
