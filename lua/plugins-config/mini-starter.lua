local M = {}
function M.config()
	local starter = require("mini.starter")
	starter.setup({
		query_updaters = [[abcdefghijklmnopqrstuvwxyz0123456789_-.]],
		items = {
			{
				name = [[current dir session]],
				action = [[SessionManager load_current_dir_session]],
				section = "Sessions",
			},
			starter.sections.recent_files(),
			starter.sections.telescope(),
			{
				name = [[Projects]],
				action = [[Telescope projects]],
				section = "Telescope",
			},
		},
		content_hooks = {
			starter.gen_hook.adding_bullet(),
			starter.gen_hook.aligning("center", "center"),
		},
	})
end
return M
