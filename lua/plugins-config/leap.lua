local M = {}

function M.config()
	vim.api.nvim_create_autocmd("User LeapEnter", { command = "nohlsearch" })
	vim.api.nvim_create_autocmd("User LeapLeave", { command = "let &hlsearch=&hlsearch" })
end

function M.map()
	nmap("J", "<Plug>(leap-forward)", "silent")
	nmap("K", "<Plug>(leap-backward)", "silent")
end

return M
