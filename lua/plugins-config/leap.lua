local M = {}

function M.config()
	require("leap").setup({
		case_insensitive = true,
		-- Leaving the appropriate list empty effectively disables "smart" mode,
		-- and forces auto-jump to be on or off.
		-- safe_labels = { . . . },
		-- labels = { . . . },
		-- These keys are captured directly by the plugin at runtime.
		special_keys = {
			next_match_group = "<space>",
			prev_match_group = "<backspace>",
			["repeat"] = "<enter>",
			revert = "<Tab>",
			accept_first_match = "L",
		},
	})
	vim.api.nvim_create_autocmd("User LeapEnter", { command = "nohlsearch" })
	vim.api.nvim_create_autocmd("User LeapLeave", { command = "let &hlsearch=&hlsearch" })
end

function M.map()
	nmap("J", "<Plug>(leap-forward)", "silent")
	nmap("K", "<Plug>(leap-backward)", "silent")
end

return M
