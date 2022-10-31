local M = {}
function M.config()
	-- Telescope
	local actions = require("telescope.actions")
	local fb_actions = require("telescope._extensions.file_browser.actions")
	require("telescope").setup({
		defaults = {
			-- generic_sorter = require("telescope.sorters").get_fzf_sorter,
			-- generic_sorter = require("mini.fuzzy").get_telescope_sorter,
			mappings = {
				n = {
					["l"] = "select_default",
					["<C-h>"] = "which_key",
					["<c-g>"] = actions.close,
					-- ["<Space><Space>"] = { "<cmd>Telescope harpoon marks<cr>", type = "command" },
				},
				i = {
					["<C-h>"] = "which_key",
					-- ["<C-s>"] = { "<cmd>Telescope harpoon marks<cr>", type = "command" },
					-- ["<Space><Space>"] = { "<cmd>Telescope harpoon marks<cr>", type = "command" },
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
			initial_mode = "insert",
			sorting_strategy = "ascending", -- "descending"
			path_display = { "truncate" },
			selection_strategy = "reset",
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
			help_tags = {
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
						["<c-d>"] = actions.delete_buffer,
					},
					i = {
						["<c-d>"] = actions.delete_buffer,
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
			current_buffer_fuzzy_find = {
				-- order same score results by line number
				tiebreak = function(current_entry, existing_entry, prompt)
					return false
				end,
				initial_mode = "insert",
			},
		},
		extensions = {
			file_browser = {
				initial_mode = "insert",
				layout_strategy = "vertical",
				-- theme = "ivy",
				depth = 3,
				layout_config = {
					vertical = {
						height = vim.o.lines, -- maximally available lines
						width = vim.o.columns, -- maximally available columns
						prompt_position = "bottom",
						preview_height = 0.4,
						mirror = false,
					},
				},
				hijack_netrw = false,
				mappings = {
					i = {
						["<C-g>"] = false,
						["<C-b>"] = fb_actions.goto_parent_dir,
						["<C-h>"] = fb_actions.toggle_hidden,
						["<C-n>"] = actions.move_selection_next,
						["<C-p>"] = actions.move_selection_previous,
					},
					n = {
						["h"] = fb_actions.goto_parent_dir,
						["<C-h>"] = "which_key",
						-- ["<C-h>"] = fb_actions.toggle_hidden,
					},
				},
			},
			fzf = {
				fuzzy = true, -- false will only do exact matching
				override_generic_sorter = true, -- override the generic sorter
				override_file_sorter = true, -- override the file sorter
				case_mode = "smart_case", -- or "ignore_case" or "respect_case"
				-- the default case_mode is "smart_case"
			},
		},
	})
	require("telescope").load_extension("fzf")
	require("telescope").load_extension("file_browser")
	require("telescope").load_extension("refactoring")
	require("project_nvim").setup({
		-- Manual mode doesn't automatically change your root directory, so you have
		-- the option to manually do so using `:ProjectRoot` command.
		manual_mode = false,

		-- Methods of detecting the root directory. **"lsp"** uses the native neovim
		-- lsp, while **"pattern"** uses vim-rooter like glob pattern matching. Here
		-- order matters: if one is not detected, the other is used as fallback. You
		-- can also delete or rearangne the detection methods.
		detection_methods = { "lsp", "pattern" },

		-- All the patterns used to detect root dir, when **"pattern"** is in
		-- detection_methods
		patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json" },

		-- Table of lsp clients to ignore by name
		-- eg: { "efm", ... }
		ignore_lsp = { "null-ls" },

		-- Don't calculate root dir on specific directories
		-- Ex: { "~/.cargo/*", ... }
		exclude_dirs = {},

		-- Show hidden files in telescope
		show_hidden = true,

		-- When set to false, you will get a message when project.nvim changes your
		-- directory.
		silent_chdir = true,

		-- Path where project.nvim will store the project history for use in
		-- telescope
		datapath = vim.fn.stdpath("data"),
	})
	require("telescope").load_extension("projects")
	require("telescope").load_extension("luasnip")
	require("telescope").load_extension("frecency")
end

function M.map()
	--Add leader shortcuts
	-- vim.keymap.set(
	-- 	"n",
	-- 	"<leader><space>",
	-- 	[[<cmd>lua require('telescope.builtin').buffers()<CR>]],
	-- 	{ noremap = true, silent = true }
	-- )
	vim.keymap.set(
		"n",
		"<leader><leader>",
		"<Cmd>lua require('telescope').extensions.frecency.frecency()<CR>",
		{ noremap = true, silent = true }
	)
	-- vim.api.nvim_set_keymap("n", "<C-e>", ":Telescope file_browser<CR>", { noremap = true })
	-- vim.api.nvim_set_keymap(
	-- 	"n",
	-- 	"<C-e>",
	-- 	[[:lua require "telescope".extensions.file_browser.file_browser()<CR>]],
	-- 	{ noremap = true }
	-- )
	-- vim.keymap.set(
	-- 	"n",
	-- 	"<C-z>",
	-- 	[[<cmd>lua require('telescope.builtin').buffers({ sort_lastused = true, ignore_current_buffer = true })<CR>]],
	-- 	{ noremap = true, silent = true }
	-- )
	-- vim.keymap.set("n", "<C-e>", ":Telescope file_browser<CR>", { noremap = true, silent = true })
	vim.keymap.set("n", "<C-p>", ":Telescope find_files<CR>", { noremap = true, silent = true })
	vim.keymap.set("n", "<leader>sf", ":Telescope find_files<CR>", { noremap = true, silent = true })
	-- vim.keymap.set("n", "<C-z>", function()
	-- 	require("telescope.builtin").spell_suggest()
	-- end, { noremap = true, silent = true })
	vim.keymap.set(
		"n",
		"<C-f>",
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
		"<leader>sz",
		[[<cmd>Telescope zoxide list initial_mode=insert<CR>]],
		{ noremap = true, silent = true }
	)
	vim.keymap.set("n", "<leader>?", [[<cmd>Telescope howdoi<CR>]], { noremap = true, silent = true })
	-- remap to open the Telescope refactoring menu in visual mode
	vim.keymap.set(
		"v",
		"<leader>r",
		"<Esc><cmd>lua require('telescope').extensions.refactoring.refactors()<CR>",
		{ noremap = true }
	)
	-- -- project.nvim
	-- vim.keymap.set("n", "<leader>p", "<cmd>Telescope projects<cr>", { silent = true, noremap = true })
	vim.keymap.set("n", "<F3>", "<Cmd>ProjectRoot<CR>", { silent = true, noremap = true }) -- set ProjectRoot manually
end

return M
