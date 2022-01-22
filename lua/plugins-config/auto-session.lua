local M = {}

function M.config()
	require("auto-session").setup({
		log_level = "info",
		auto_session_suppress_dirs = { "~/", "~/Projects" },
		-- post_restore_cmds = { "CtrlSpaceLoadWorkspace" },
	})
end

return M
