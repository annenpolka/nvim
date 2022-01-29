local M = {}

function M.config()
	-- Neogit Settings
	-- -- setup
	local neogit = require("neogit")
	neogit.setup({
		disable_commit_confirmation = true,
		integrations = {
			diffview = true, -- set diffview.nvim integration
		},
	})
end

function M.map()
	vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>Neogit<CR>", { noremap = true })
	nnoremap("<C-c><C-c>", ":wq<CR>", { ft = "NeogitCommitMessage" })
end

return M
