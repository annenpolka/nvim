local M = {}

function M.config()
	local autosave = require("autosave")
	autosave.setup({
		enabled = false,
		execution_message = "AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"),
		events = { "InsertLeave" },
		conditions = {
			exists = true,
			filename_is_not = {},
			filetype_is_not = {},
			modifiable = true,
		},
		write_all_buffers = false,
		on_off_commands = true,
		clean_command_line_interval = 0,
		debounce_delay = 10000,
	})
end

return M
