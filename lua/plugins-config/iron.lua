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
			repl_open_cmd = require("iron.view").curry.right(80),
			-- how the REPL window will be opened, the default is opening
			-- a float window of height 40 at the bottom.
		},
		-- Iron doesn't set keymaps by default anymore. Set them here
		-- or use `should_map_plug = true` and map from you vim files
		keymaps = {
			send_motion = "<space>sc",
			visual_send = "<space>sc",
			send_line = "<space>sl",
			-- send_mark = "<space>sm",
			-- mark_motion = "<space>mc",
			-- mark_visual = "<space>mc",
			-- remove_mark = "<space>md",
			cr = "<space>s<cr>",
			interrupt = "<space>s<space>",
			exit = "<space>sq",
			clear = "<space>cl",
		},
		-- If the highlight is on, you can change how it looks
		-- For the available options, check nvim_set_hl
		highlight = {
			italic = true,
		},
	})
end

function M.map()
	vim.keymap.set("n", "<leader>if", "<Cmd>IronFocus<CR>", {})
	vim.keymap.set("n", "<leader>ir", "<Cmd>IronRepl<CR>", {})
end

return M
