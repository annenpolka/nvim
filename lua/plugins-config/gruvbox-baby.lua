local M = {}

function M.config()
	vim.g.gruvbox_baby_background_color = "dark"
	vim.g.gruvbox_baby_function_style = "italic"
	vim.g.gruvbox_baby_keyword_style = "italic"
	vim.g.gruvbox_baby_comment_style = "NONE"
	vim.g.gruvbox_baby_variable_style = "NONE"
	-- Enable telescope theme
	vim.g.gruvbox_baby_telescope_theme = 1
	-- Enable transparent mode
	-- vim.g.gruvbox_baby_transparent_mode = 1
end

return M
