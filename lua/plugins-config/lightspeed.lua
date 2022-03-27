local M = {}

function M.map()
	vim.g.lightspeed_no_default_keymaps = 1
	nmap("f", "<Plug>Lightspeed_f", "silent")
	nmap("F", "<Plug>Lightspeed_F", "silent")
	nmap("t", "<Plug>Lightspeed_t", "silent")
	nmap("T", "<Plug>Lightspeed_T", "silent")
end

return M
