local M = {}

function M.config()
	-- override highlights
	vim.cmd("hi TabLine gui=NONE")
	vim.cmd("hi CmpItemMenuDefault guifg=#666666")
end

return M
