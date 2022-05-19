local M = {}

function M.config()
	-- override highlights
	vim.cmd("hi TabLine gui=NONE")
	vim.cmd("hi CmpItemMenuDefault guifg=#666666")
	vim.cmd("hi VertSplit gui=NONE")
end

return M
