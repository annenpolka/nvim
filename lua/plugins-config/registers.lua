local M = {}
function M.config()
	vim.g.registers_window_border = "single"
	vim.g.registers_window_min_height = 10
	vim.g.registers_window_max_width = 200
	vim.g.registers_paste_in_normal_mode = 1
end

return M
