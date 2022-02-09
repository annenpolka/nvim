local M = {}

function M.config()
	require("nvim_context_vt").setup({
		-- Override default virtual text prefix
		-- Default: '-->'
		prefix = "",

		-- Override the internal highlight group name
		-- Default: 'ContextVt'
		highlight = "ContextVt",

		-- Disable virtual text for given filetypes
		-- Default: { 'markdown' }
		disable_ft = { "markdown" },

		-- Disable display of virtual text below blocks for indentation based languages like Python
		-- Default: false
		disable_virtual_lines = false,

		-- Same as above but only for specific filetypes
		-- Default: {}
		disable_virtual_lines_ft = {},

		-- How many lines required after starting position to show virtual text
		-- Default: 1 (equals two lines total)
		min_rows = 1,

		-- Same as above but only for specific filetypes
		-- Default: {}
		min_rows_ft = {},
	})
end

return M
