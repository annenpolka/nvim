local M = {}

function M.config()
	-- Treesitter configuration
	-- Parsers must be installed manually via :TSInstall
	require("nvim-treesitter.configs").setup({
		ensure_installed = "maintained",
		highlight = {
			enable = true, -- false will disable the whole extension
		},
		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = "gnn",
				node_incremental = "grn",
				scope_incremental = "grc",
				node_decremental = "grm",
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
					-- ["af"] = "@function.outer",
					-- ["if"] = "@function.inner",
					["ac"] = "@class.outer",
					["ic"] = "@class.inner",
					["ia"] = "@parameter.inner",
					["aa"] = "@parameter.outer",
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
			max_file_lines = nil, -- Do not enable for files with more than n lines, int
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
