local M = {}

function M.map()
	vim.keymap.set("n", "<leader>Gt", "<Cmd>lua require('agitator').git_time_machine()<CR>")
end

return M
