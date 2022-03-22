local M = {}

function M.config()
	require("nightfox").setup({
		options = {
			-- Compiled file's destination location
			dim_inactive = true, -- Non focused panes set to alternative background
			styles = { -- Style to be applied to different syntax groups
				comments = "NONE",
				functions = "italic",
				keywords = "italic",
				numbers = "NONE",
				strings = "NONE",
				types = "italic",
				variables = "NONE",
			},
			inverse = { -- Inverse highlight for different types
				match_paren = false,
				visual = false,
				search = true,
			},
		},
	})
end

return M
