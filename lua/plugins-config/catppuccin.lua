local M = {}
function M.config()
	require("catppuccin").setup({
		transparent_background = false,
		term_colors = false,
		styles = {
			comments = "italic",
			functions = "italic",
			keywords = "italic",
			strings = "NONE",
			variables = "NONE",
		},
		integrations = {
			treesitter = true,
			native_lsp = {
				enabled = true,
				virtual_text = {
					errors = "italic",
					hints = "italic",
					warnings = "italic",
					information = "italic",
				},
				underlines = {
					errors = "underline",
					hints = "underline",
					warnings = "underline",
					information = "underline",
				},
			},
			lsp_trouble = true,
			cmp = true,
			lsp_saga = false,
			gitgutter = true,
			gitsigns = true,
			telescope = true,
			nvimtree = {
				enabled = true,
				show_root = true,
			},
			which_key = true,
			indent_blankline = {
				enabled = false,
				colored_indent_levels = false,
			},
			dashboard = true,
			neogit = true,
			vim_sneak = false,
			fern = false,
			barbar = false,
			bufferline = true,
			markdown = true,
			lightspeed = false,
			ts_rainbow = true,
			hop = false,
			notify = true,
			telekasten = true,
		},
	})
	vim.cmd([[colorscheme catppuccin]])
end

return M
