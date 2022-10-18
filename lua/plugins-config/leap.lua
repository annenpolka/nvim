local M = {}

function M.config()
	local leap = require("leap")
	leap.setup({
		max_aot_targets = nil,
		highlight_unlabeled = false,
		max_highlighted_traversal_targets = 10,
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
			next_phase_one_target = "<enter>",
			next_target = { "<enter>", ";" },
			prev_target = { "<tab>", "," },
			next_group = "<space>",
			prev_group = "<tab>",
			multi_accept = "<enter>",
			multi_revert = "<backspace>",
		},
	})
	-- require("leap").set_default_keymaps()
end

function M.multi_normal()
	-- The following example showcases a custom action, using `multiselect`. We're
	-- executing a `normal!` command at each selected position (this could be even
	-- more useful if we'd pass in custom targets too).

	local function paranormal(targets)
		-- Get the :normal sequence to be executed.
		local input = vim.fn.input("normal! ")
		if #input < 1 then
			return
		end

		local ns = vim.api.nvim_create_namespace("")

		-- Set an extmark as an anchor for each target, so that we can also execute
		-- commands that modify the positions of other targets (insert/change/delete).
		for _, target in ipairs(targets) do
			local line, col = unpack(target.pos)
			local id = vim.api.nvim_buf_set_extmark(0, ns, line - 1, col - 1, {})
			target.extmark_id = id
		end

		-- Jump to each extmark (anchored to the "moving" targets), and execute the
		-- command sequence.
		for _, target in ipairs(targets) do
			local id = target.extmark_id
			local pos = vim.api.nvim_buf_get_extmark_by_id(0, ns, id, {})
			vim.fn.cursor(pos[1] + 1, pos[2] + 1)
			vim.cmd("normal! " .. input)
		end

		-- Clean up the extmarks.
		vim.api.nvim_buf_clear_namespace(0, ns, 0, -1)
	end

	-- Usage:
	require("leap").leap({
		target_windows = { vim.fn.win_getid() },
		action = paranormal,
		multiselect = true,
	})
end

function M.map()
	vim.keymap.set({ "n", "v", "o" }, "J", "<Plug>(leap-forward)", { silent = true })
	vim.keymap.set({ "n", "v", "o" }, "K", "<Plug>(leap-backward)", { silent = true })
	vim.keymap.set({ "n", "v", "o" }, "S", function()
		require("leap").leap({ target_windows = { vim.fn.win_getid() } })
	end, { silent = true })
	-- vim.keymap.set({ "n", "v", "o" }, "<C-n>", M.multi_normal, { silent = true })
end

return M
