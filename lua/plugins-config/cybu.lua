local M = {}

function M.config()
	require("cybu").setup({
		position = {
			relative_to = "win", -- win, editor, cursor
			anchor = "center", -- topleft, topcenter, topright,
			-- centerleft, center, centerright,
			-- bottomleft, bottomcenter, bottomright
			vertical_offset = 0, -- vertical offset from anchor in lines
			horizontal_offset = 0, -- vertical offset from anchor in columns
			max_win_height = 10, -- height of cybu window in lines
			max_win_width = 0.5, -- integer for absolute in columns
			-- float for relative to win/editor width
		},
		style = {
			path = "tail", -- absolute, relative, tail (filename only)
			border = "rounded", -- single, double, rounded, none
			separator = " ", -- string used as separator
			prefix = "…", -- string used as prefix for truncated paths
			padding = 1, -- left & right padding in number of spaces
			hide_buffer_id = false, -- hide buffer IDs in window
			devicons = {
				enabled = true, -- enable or disable web dev icons
				colored = true, -- enable color for web dev icons
			},
			highlights = { -- see highlights via :highlight
				current_buffer = "Visual", -- used for the current buffer
				adjacent_buffers = "Comment", -- used for buffers not in focus
				background = "Normal", -- used for the window background
			},
		},
		display_time = 750, -- time the cybu window is displayed
		exclude = { -- filetypes, cybu will not be active
			"neo-tree",
			"fugitive",
			"qf",
		},
		fallback = function() end, -- arbitrary fallback function
		-- used in excluded filetypes
	})
end

function M.map()
	vim.keymap.set("n", "-", "<Plug>(CybuPrev)")
	vim.keymap.set("n", "^", "<Plug>(CybuNext)")
end

return M
