local M = {}
function M.config()
	-- use for session list
	require("mini.sessions").setup({
		-- Whether to read latest session if Neovim opened without file arguments
		autoread = false,
		-- Whether to write current session before quitting Neovim
		autowrite = false,
		-- Directory where global sessions are stored (use `''` to disable)
		directory = "~/.local/share/nvim/sessions", --<"session" subdir of user data directory from |stdpath()|>,
		-- File for local session (use `''` to disable)
		file = "", -- 'Session.vim',
	})

	local starter = require("mini.starter")
	starter.setup({
		query_updaters = [[abcdefghijklmnopqrstuvwxyz0123456789_-.]],
		items = {
			{
				name = [[load current dir session]],
				-- action = [[SessionManager load_current_dir_session]],
				action = [[SessionLoad]],
				section = "Sessions",
			},
			-- starter.sections.sessions(5, true),
			-- {
			--
			-- 	name = "load current directory session",
			-- 	action = [[lua require"resession".load(vim.fn.getcwd(), { dir = "session", silence_errors = true })]],
			-- 	section = "Sessions",
			-- },
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

function M.map()
	vim.api.nvim_create_autocmd("User", {
		pattern = "MiniStarterOpened",

		callback = function()
			-- vim.keymap.set("n", "J", "<Cmd>lua MiniStarter.update_current_item('next')<CR>", { buffer = 0 })
			-- vim.keymap.set("n", "K", "<Cmd>lua MiniStarter.update_current_item('prev')<CR>", { buffer = 0 })
		end,
	})
end

return M
