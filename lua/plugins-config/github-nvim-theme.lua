local M = {}

function M.config()
	require("github-theme").setup({
		theme_style = "dark",
		comment_style = "NONE",
		keyword_style = "italic",
		function_style = "italic",
		variable_style = "NONE",
		sidebars = { "qf", "vista_kind", "terminal", "packer" },
	})
end

return M
