local M = {}

function M.config()
	local group = vim.api.nvim_create_augroup("VMlens", { clear = true })
	local autocmd = vim.api.nvim_create_autocmd
	autocmd("User", {
		pattern = "visual_multi_start",
		desc = "start VMlens",
		callback = function()
			require("module.vmlens").start()
		end,
		group = group,
	})
	autocmd("User", {
		pattern = "visual_multi_exit",
		desc = "start VMlens",
		callback = function()
			require("module.vmlens").exit()
		end,
		group = group,
	})
end

function M.map()
	-- vim.g.VM_maps = {
	-- 	Exit = "<C-g>",
	-- }
end

return M
