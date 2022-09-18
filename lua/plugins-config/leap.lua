local M = {}

function M.config()
	require("leap").setup({
		max_aot_targets = nil,
		highlight_unlabeled = false,
		case_sensitive = false,
		-- Sets of characters that should match each other.
		-- Obvious candidates are braces and quotes ('([{', ')]}', '`"\'').
		equivalence_classes = { " \t\r\n" },
		-- Leaving the appropriate list empty effectively disables "smart" mode,
		-- and forces auto-jump to be on or off.
		-- safe_labels = { . . . },
		-- labels = { . . . },
		special_keys = {
			repeat_search = "<enter>",
			next_match = "<enter>",
			prev_match = "<tab>",
			next_group = "<space>",
			prev_group = "<tab>",
		},
	})
	-- require("leap").set_default_keymaps()
end

function M.map()
	vim.keymap.set({ "n", "v", "o" }, "J", "<Plug>(leap-forward)", { silent = true })
	vim.keymap.set({ "n", "v", "o" }, "K", "<Plug>(leap-backward)", { silent = true })
	vim.keymap.set({ "n", "v", "o" }, "S", function()
		require("leap").leap({ target_windows = { vim.fn.win_getid() } })
	end, { silent = true })
end

return M
