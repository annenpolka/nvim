local M = {}

function M.config()
	vim.g.nordbones = {
		zenbones_solid_line_nr = true,
		darkness = "stark",
		colorize_diagnostic_underline_text = true,
	}
	vim.cmd([[colorscheme forestbones]])
end

return M
