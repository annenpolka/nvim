local M = {}
function M.config()
	local starter = require("mini.starter")
	starter.setup({
		query_updaters = [[abcdefghijklnopqrstuvwxyz0123456789_-.]],
		items = {
			{
				name = [[current dir session]],
				action = [[SessionManager load_current_dir_session]],
				section = "Sessions",
			},
			starter.sections.recent_files(),
			starter.sections.telescope(),
			{
				name = [[projects]],
				action = [[Telescope projects]],
				section = "Telescope",
			},
			{
				name = [[opener]],
				action = [[Telescope opener hidden=false]],
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
