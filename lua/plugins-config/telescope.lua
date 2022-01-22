local M = {}
function M.config()
	-- Telescope
	require("telescope").setup({
		defaults = {
			mappings = {
				n = {
					["l"] = "select_default",
				},
			},
		},
		pickers = {
			find_files = { theme = "ivy" },
			tags = { theme = "ivy" },
			buffers = { theme = "ivy" },
			live_grep = {
				layout_strategy = "flex",
				theme = "ivy",
			},
		},
		extensions = {
			file_browser = {
				layout_strategy = "flex",
				theme = "ivy",
				depth = 1,
			},
		},
	})
	require("telescope").load_extension("file_browser")
	require("telescope").load_extension("refactoring")
end

function M.map()
	--Add leader shortcuts
	-- vim.api.nvim_set_keymap(
	-- "n",
	-- "<leader><space>",
	-- [[<cmd>lua require('telescope.builtin').buffers()<CR>]],
	-- { noremap = true, silent = true }
	-- )
	vim.api.nvim_set_keymap("n", "<C-e>", ":Telescope file_browser<CR>", { noremap = true, silent = true })
	vim.api.nvim_set_keymap("n", "<leader>sf", ":Telescope find_files<CR>", { noremap = true, silent = true })
	vim.api.nvim_set_keymap(
		"n",
		"<leader>sb",
		[[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>]],
		{ noremap = true, silent = true }
	)
	vim.api.nvim_set_keymap(
		"n",
		"<leader>sh",
		[[<cmd>lua require('telescope.builtin').help_tags()<CR>]],
		{ noremap = true, silent = true }
	)
	vim.api.nvim_set_keymap(
		"n",
		"<leader>st",
		[[<cmd>lua require('telescope.builtin').tags()<CR>]],
		{ noremap = true, silent = true }
	)
	vim.api.nvim_set_keymap(
		"n",
		"<leader>sd",
		[[<cmd>lua require('telescope.builtin').grep_string()<CR>]],
		{ noremap = true, silent = true }
	)
	vim.api.nvim_set_keymap(
		"n",
		"<leader>sp",
		[[<cmd>lua require('telescope.builtin').live_grep()<CR>]],
		{ noremap = true, silent = true }
	)
	vim.api.nvim_set_keymap(
		"n",
		"<leader>so",
		[[<cmd>lua require('telescope.builtin').tags{ only_current_buffer = true }<CR>]],
		{ noremap = true, silent = true }
	)
	vim.api.nvim_set_keymap(
		"n",
		"<leader>?",
		[[<cmd>lua require('telescope.builtin').oldfiles()<CR>]],
		{ noremap = true, silent = true }
	)
	-- remap to open the Telescope refactoring menu in visual mode
	vim.api.nvim_set_keymap(
		"v",
		"<leader>r",
		"<Esc><cmd>lua require('telescope').extensions.refactoring.refactors()<CR>",
		{ noremap = true }
	)
	-- -- project.nvim
	vim.api.nvim_set_keymap("n", "<leader>p", "<cmd>Telescope projects<cr>", { silent = true, noremap = true })
end

return M
