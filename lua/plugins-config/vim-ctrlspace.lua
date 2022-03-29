local M = {}

function M.config()
	vim.g.CtrlSpaceDefaultMappingKey = "<leader>z "
	vim.g.CtrlSpaceUseTabline = 0
	vim.g.CtrlSpaceSearchTiming = 50
	vim.g.CtrlSpaceSaveWorkspaceOnExit = 0
	vim.g.CtrlSpaceLoadLastWorkspaceOnStart = 0
	vim.g.CtrlSpaceSaveWorkspaceOnSwitch = 0
end

function M.map()
	-- vim.keymap.set("n", "<C-a>", ":CtrlSpace a<CR>", { noremap = true, silent = true })
	vim.keymap.set("n", "-", ":CtrlSpaceGoDown<CR>", { noremap = true, silent = true })
	vim.keymap.set("n", "^", ":CtrlSpaceGoUp<CR>", { noremap = true, silent = true })
end

return M
