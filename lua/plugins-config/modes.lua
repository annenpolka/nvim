local M = {}

function M.config()
	require("modes").setup({
		-- Cursorline highlight opacity
		line_opacity = 0.2,

		-- Highlight cursor
		set_cursor = false,

		-- Highlight in active window only
		focus_only = false,
	})
end

return M
