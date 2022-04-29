local M = {}

function M.config()
	require("mini.jump").setup({
		-- Module mappings. Use `''` (empty string) to disable one.
		mappings = {
			forward = "f",
			backward = "F",
			forward_till = "t",
			backward_till = "T",
			repeat_jump = ";",
		},

		-- Delay (in ms) between jump and highlighting all possible jumps. Set to
		-- a very big number (like 10^7) to virtually disable highlighting.
		-- highlight_delay = 500,

		delay = {
			-- Delay (in ms) between jump and highlighting all possible jumps. Set to
			-- a very big number (like 10^7) to virtually disable highlighting.
			highlight = 50,

			-- Timeout value (in ms) to stop jumping automatically after idle. Set to
			-- a very big number (like 10^7) to virtually disable timeout.
			idle_stop = 1000,
		},
	})
	-- define MiniJump highlight color
	-- vim.cmd([[highlight link MiniJump Sneak]])
end

return M
