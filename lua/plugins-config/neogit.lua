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
		sections = {
			untracked = {
				folded = false,
			},
			unstaged = {
				folded = false,
			},
			staged = {
				folded = false,
			},
			stashes = {
				folded = true,
			},
			unpulled = {
				folded = true,
			},
			unmerged = {
				folded = false,
			},
			recent = {
				folded = true,
			},
		},
	})
end

function M.map()
	-- vim.keymap.set("n", "<leader>g", "<cmd>Neogit<CR>", { noremap = true })
	nnoremap("<C-c><C-c>", ":wq<CR>", { ft = "NeogitCommitMessage" })
end

return M
