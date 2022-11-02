local M = {}

function M.config()
	require("satellite").setup({
		current_only = false,
		winblend = 50,
		zindex = 40,
		excluded_filetypes = {},
		width = 2,
		handlers = {
			search = {
				enable = true,
			},
			diagnostic = {
				enable = true,
			},
			gitsigns = {
				enable = true,
			},
			marks = {
				enable = false,
				show_builtins = false, -- shows the builtin marks like [ ] < >
			},
		},
	})
end

return M
