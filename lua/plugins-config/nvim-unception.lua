local M = {}

function M.config()
	vim.g.unception_open_buffer_in_new_tab = true
	-- close toggleterm window on open file
	vim.api.nvim_create_autocmd("User", {
		pattern = "UnceptionEditRequestReceived",
		callback = function()
			require("toggleterm").toggle_all(true)
		end,
	})
end

return M
