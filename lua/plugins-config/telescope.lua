local M = {}
function M.config()
	-- Telescope
	require("telescope").setup({
		defaults = {
			-- generic_sorter = require("telescope.sorters").get_fzy_sorter,
			generic_sorter = require("mini.fuzzy").get_telescope_sorter,
			mappings = {
				n = {
					["l"] = "select_default",
				},
				i = {
					["<c-q>"] = function(prompt_bufnr) -- back to normal mode when qflist is opened
						require("telescope.actions").smart_send_to_qflist(prompt_bufnr)
						require("telescope.actions").open_qflist(prompt_bufnr)
						vim.api.nvim_input("<esc>")
					end,
				},
			},
			layout_strategy = "vertical",
			layout_config = {
				horizontal = {
					prompt_position = "top",
					preview_width = 0.55,
					preview_cutoff = 120,
				},
				vertical = {
					height = vim.o.lines, -- maximally available lines
					width = vim.o.columns, -- maximally available columns
					prompt_position = "bottom",
					preview_height = 0.6, -- 60% of available lines
					mirror = false,
				},
				-- width = 0.87,
				-- height = 0.80,
				flex = {
					preview_cutoff = 120,
				},
			},
			initial_mode = "normal",
			path_display = { "truncate" },
			selection_strategy = "follow",
			border = {},
		},
		pickers = {
			find_files = {
				theme = "ivy",
				initial_mode = "insert",
			},
			fd = {
				-- theme = "dropdown",
				initial_mode = "insert",
			},
			tags = {
				-- theme = "ivy",
			},
			buffers = {
				initial_mode = "insert",
				-- theme = "ivy",
				mappings = {
					n = {
						["<c-d>"] = require("telescope.actions").delete_buffer,
					},
					i = {
						["<c-d>"] = require("telescope.actions").delete_buffer,
					},
				},
			},
			live_grep = {
				-- layout_strategy = "flex",
				-- theme = "ivy",
				initial_mode = "insert",
				on_input_filter_cb = function(prompt)
					-- AND operator for live_grep like how fzf handles spaces with wildcards in rg
					return { prompt = prompt:gsub("%s", ".*") }
				end,
			},
			spell_suggest = {
				theme = "ivy",
			},
		},
		extensions = {
			file_browser = {
				layout_strategy = "flex",
				theme = "ivy",
				depth = 2,
			},
		},
	})
	-- require("telescope").load_extension("fzy_native")
	require("telescope").load_extension("file_browser")
	require("telescope").load_extension("refactoring")
	require("project_nvim").setup({ manual_mode = true })
	require("telescope").load_extension("projects")
	require("telescope").load_extension("frecency")
	require("telescope").load_extension("luasnip")
end

function M.map()
	--Add leader shortcuts
	-- vim.keymap.set(
	-- "n",
	-- "<leader><space>",
	-- [[<cmd>lua require('telescope.builtin').buffers()<CR>]],
	-- { noremap = true, silent = true }
	-- )
	vim.keymap.set(
		"n",
		"<C-a>",
		[[<cmd>lua require('telescope.builtin').buffers({ sort_lastused = true, ignore_current_buffer = true })<CR>]],
		{ noremap = true, silent = true }
	)
	-- vim.keymap.set("n", "<C-e>", ":Telescope file_browser<CR>", { noremap = true, silent = true })
	vim.keymap.set("n", "<C-p>", ":Telescope find_files<CR>", { noremap = true, silent = true })
	-- vim.keymap.set("n", "<C-z>", function()
	-- 	require("telescope.builtin").spell_suggest()
	-- end, { noremap = true, silent = true })
	vim.keymap.set(
		"n",
		"<leader>sb",
		[[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>]],
		{ noremap = true, silent = true }
	)
	vim.keymap.set(
		"n",
		"<leader>sh",
		[[<cmd>lua require('telescope.builtin').help_tags()<CR>]],
		{ noremap = true, silent = true }
	)
	vim.keymap.set(
		"n",
		"<leader>st",
		[[<cmd>lua require('telescope.builtin').tags()<CR>]],
		{ noremap = true, silent = true }
	)
	vim.keymap.set(
		"n",
		"<leader>sd",
		[[<cmd>lua require('telescope.builtin').grep_string()<CR>]],
		{ noremap = true, silent = true }
	)
	vim.keymap.set(
		"n",
		"<leader>sp",
		[[<cmd>lua require('telescope.builtin').live_grep()<CR>]],
		{ noremap = true, silent = true }
	)
	vim.keymap.set(
		"n",
		"<leader>so",
		[[<cmd>lua require('telescope.builtin').tags{ only_current_buffer = true }<CR>]],
		{ noremap = true, silent = true }
	)
	vim.keymap.set(
		"n",
		"<leader>?",
		[[<cmd>lua require('telescope.builtin').oldfiles()<CR>]],
		{ noremap = true, silent = true }
	)
	-- remap to open the Telescope refactoring menu in visual mode
	vim.keymap.set(
		"v",
		"<leader>r",
		"<Esc><cmd>lua require('telescope').extensions.refactoring.refactors()<CR>",
		{ noremap = true }
	)
	-- -- project.nvim
	vim.keymap.set("n", "<leader>p", "<cmd>Telescope projects<cr>", { silent = true, noremap = true })
end

return M
