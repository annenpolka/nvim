local M = {}

function M.config()
	require("auto-session").setup({
		log_level = "info",
		auto_session_suppress_dirs = { "~/", "~/Projects" },
	})
end

return M
