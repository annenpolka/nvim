local M = {}

function M.config()
	vim.g.copilot_no_tab_map = true
	vim.b.copilot_enabled = true
	imap("<C-J>", [[copilot#Accept('<CR>')]], { silent = true, script = true, expr = true })
	imap("<C-z>", "<Plug>(copilot-next)")
	imap("<C-x>", "<Plug>(copilot-previous)")
end

return M
