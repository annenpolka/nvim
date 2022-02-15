local M = {}

function M.config()
	vim.g.nordbones = {
		zenbones_solid_line_nr = true,
		darkness = "warm",
		colorize_diagnostic_underline_text = true,
	}
	vim.cmd([[colorscheme nordbones]])
end

return M
