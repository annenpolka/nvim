local M = {}

function M.config()
	-- workaround for `ts_utils.get_node_text` deprecation
	local ts_utils = require("nvim-treesitter.ts_utils")
	ts_utils.get_node_text = vim.treesitter.query.get_node_text

	-- treesitter configration
	require("nvim-treesitter.configs").setup({
		ensure_installed = {
			"lua",
			"cpp",
			"rust",
			"javascript",
			"typescript",
			"tsx",
			"python",
			"html",
			"css",
			"json",
			"toml",
			"ocaml",
			"regex",
			"make",
			"bash",
		},
		highlight = {
			enable = true, -- false will disable the whole extension
		},
		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = "gv",
				node_incremental = "v",
				scope_incremental = "gv",
				node_decremental = "V",
			},
		},
		indent = {
			enable = true,
		},
		textobjects = {
			select = {
				enable = true,
				lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
				keymaps = {
					-- You can use the capture groups defined in textobjects.scm
					["aF"] = "@function.outer",
					["iF"] = "@function.inner",
					["ac"] = "@class.outer",
					["ic"] = "@class.inner",
					["ia"] = "@parameter.inner",
					["aa"] = "@parameter.outer",
					["ix"] = "@swappable",
				},
			},
			move = {
				enable = true,
				set_jumps = true, -- whether to set jumps in the jumplist
				goto_next_start = {
					["]m"] = "@function.outer",
					["]]"] = "@class.outer",
				},
				goto_next_end = {
					["]M"] = "@function.outer",
					["]["] = "@class.outer",
				},
				goto_previous_start = {
					["[m"] = "@function.outer",
					["[["] = "@class.outer",
				},
				goto_previous_end = {
					["[M"] = "@function.outer",
					["[]"] = "@class.outer",
				},
			},
			swap = {
				enable = true,
				swap_next = {
					["cx"] = "@swappable",
				},
				swap_previous = {
					["cX"] = "@swappable",
				},
			},
		},
		-- nvim-ts-rainbow
		rainbow = {
			enable = true,
			-- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
			extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
			max_file_lines = 300, -- Do not enable for files with more than n lines, int
			-- colors = {}, -- table of hex strings
			-- termcolors = {} -- table of colour name strings
		},
		-- html autotag
		autotag = {
			enable = true,
		},
		matchup = {
			enable = true, -- mandatory, false will disable the whole extension
			-- disable = { "c", "ruby" }, -- optional, list of language that will be disabled
			-- [options]
		},
	})
end

return M
