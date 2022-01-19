local M = {}

function M.config()
	vim.g.CtrlSpaceDefaultMappingKey = "<C-a> "
	vim.g.CtrlSpaceUseTabline = 0
	vim.g.CtrlSpaceSearchTiming = 50
	vim.g.CtrlSpaceSaveWorkspaceOnExit = 1
	vim.g.CtrlSpaceLoadLastWorkspaceOnStart = 1
	vim.g.CtrlSpaceSaveWorkspaceOnSwitch = 1
end

return M
