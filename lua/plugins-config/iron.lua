local M = {}

function M.config()
	local iron = require("iron.core")

	iron.setup({
		config = {
			-- If iron should expose `<plug>(...)` mappings for the plugins
			should_map_plug = false,
			-- Whether a repl should be discarded or not
			scratch_repl = true,
			-- Your repl definitions come here
			repl_definition = {
				sh = {
					command = { "zsh" },
				},
			},
			-- Repl position. Check `iron.view` for more options
			repl_open_cmd = require("iron.view").curry.right(90),
		},
		-- Iron doesn't set keymaps by default anymore. Set them here
		-- or use `should_map_plug = true` and map from you vim files
		keymaps = {
			send_motion = "<space>sc",
			visual_send = "<space>sc",
			send_line = "<space>sl",
			repeat_cmd = "<space>s.",
			cr = "<space>s<cr>",
			interrupt = "<space>s<space>",
			exit = "<space>sq",
			clear = "<space>cl",
		},
	})
end

return M
