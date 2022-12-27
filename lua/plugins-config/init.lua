-- initialize packer
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local packer_bootstrap
if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
end

-- load plugin after entering vim ui
-- HACK: This shouldn't be global, but this won't work with local keyword
Lazyload_timer = function(plugin, timer)
	if plugin then
		timer = timer or 100
		vim.defer_fn(function()
			require("packer").loader(plugin)
		end, timer)
	end
end

-- ╭──────────────────────────────────────────────────────────╮
-- │                      plugins loading                     │
-- ╰──────────────────────────────────────────────────────────╯
require("packer").startup({
	function(use)
		use({ "wbthomason/packer.nvim" })
		-- lua loading optimizer
		use({ "lewis6991/impatient.nvim" })
		-- faster filetype
		-- use({ "nathom/filetype.nvim" })
		-- faster matchparen
		use({
			-- disable = true, -- won't work with vim-matchup
			"monkoose/matchparen.nvim",
			config = function()
				require("plugins-config.matchparen").config()
			end,
		})
		-- major startuptime
		use({
			"dstein64/vim-startuptime",
		})
		-- ╭──────────────────────────────────────────────────────────╮
		-- │                    runtime, dependency                   │
		-- ╰──────────────────────────────────────────────────────────╯
		-- use({
		-- 	"vim-denops/denops.vim",
		-- 	event = "BufRead",
		-- })
		use({ "kyazdani42/nvim-web-devicons" })
		use({ "nvim-lua/plenary.nvim" })
		use({ "MunifTanjim/nui.nvim" })
		-- fzf
		-- use({
		-- 	"junegunn/fzf",
		-- 	disable = true,
		-- 	run = function()
		-- 		fn["fzf#install"]()
		-- 	end,
		-- })
		-- mapping helper functions
		use({ "b0o/mapx.nvim" })
		-- submode mapping
		use({
			"anuvyklack/hydra.nvim",
			requires = { "anuvyklack/keymap-layer.nvim", module = "keymap-layer" }, -- needed only for pink hydras
			config = function()
				require("plugins-config.hydra").config()
				-- require("plugins-config.hydra").quickfix_mode()
			end,
			event = "BufRead",
		})
		-- extended dot repeat
		use({ "tpope/vim-repeat" })
		-- lua documentation help
		use({ "milisims/nvim-luaref" })
		---------------------------------------------------------------------------------
		-- ╭──────────────────────────────────────────────────────────╮
		-- │                          Utility                         │
		-- ╰──────────────────────────────────────────────────────────╯
		-- UI overhaul
		use({
			"stevearc/dressing.nvim",
			config = function()
				require("plugins-config.dressing").config()
			end,
			event = "BufRead",
		})
		-- commandline/notification front-end
		-- use({
		-- 	"folke/noice.nvim",
		-- 	disable = true,
		-- 	-- event = "LspAttach",
		-- 	setup = function()
		-- 		require("plugins-config.noice").map()
		-- 	end,
		-- 	config = function()
		-- 		require("plugins-config.noice").config()
		-- 	end,
		-- 	requires = {
		-- 		-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
		-- 		"MunifTanjim/nui.nvim",
		-- 		"rcarriga/nvim-notify",
		-- 	},
		-- })
		-- sudo
		use({
			"lambdalisue/suda.vim",
			cmd = { "SudaWrite", "SudaRead" },
		})
		-- programming dictionary
		use({
			"psliwka/vim-dirtytalk",
			run = ":DirtytalkUpdate",
			cmd = "DirtytalkUpdate",
		})
		-- Session manager
		use({
			"olimorris/persisted.nvim",
			setup = function()
				require("plugins-config.persisted").map()
			end,
			config = function()
				require("plugins-config.persisted").config()
			end,
		})
		-- Close buffer/window/vim wisely
		use({
			"mhinz/vim-sayonara",
			requires = { { "AndrewRadev/undoquit.vim", event = "BufRead" } },
			setup = function()
				require("plugins-config.sayonara").map()
			end,
			cmd = { "Sayonara", "Sayonara!" },
		})
		-- locking a buffer to specific window
		use({
			"stevearc/stickybuf.nvim",
			config = function()
				require("plugins-config.stickybuf").config()
			end,
			event = "BufRead",
		})
		-- automatic split management
		use({
			"beauwilliams/focus.nvim",
			setup = function()
				require("plugins-config.focus").map()
			end,
			config = function()
				require("plugins-config.focus").config()
			end,
			-- event = "BufRead",
		})
		-- automatic indent detection
		-- use({
		-- 	"tpope/vim-sleuth",
		-- 	disable = true, -- conflict with noice.nvim
		-- })
		-- Better Escape
		use({
			"max397574/better-escape.nvim",
			config = function()
				require("plugins-config.better-escape").config()
			end,
			event = "InsertEnter",
		})
		-- readline keybindings in insert mode
		use({
			"linty-org/readline.nvim",
			config = function()
				require("plugins-config.readline").map()
			end,
			event = "BufRead",
		})
		-- better gf
		use({
			"notomo/curstr.nvim",
			setup = function()
				require("plugins-config.curstr").map()
			end,
			config = function()
				require("plugins-config.curstr").config()
			end,
			event = "BufRead",
		})
		-- switch working directory
		use({
			"nyngwang/NeoRoot.lua",
			setup = function()
				require("plugins-config.neoroot").map()
			end,
			cmd = {
				"NeoRoot",
				"NeoRootChange",
				"NeoRootSwitchMode",
			},
		})
		-- redirect command output to dedicated buffer
		use({
			"sbulav/nredir.nvim",
			setup = function()
				require("plugins-config.nredir").map()
			end,
			cmd = "Nredir",
		})
		-- mkdir on save
		use({
			"jghauser/mkdir.nvim",
		})
		-- open file without nesting on terminal
		use({
			"samjwill/nvim-unception",
			config = function()
				require("plugins-config.nvim-unception").config()
			end,
		})
		-- better sorting
		use({
			"sQVe/sort.nvim",
			setup = function()
				require("plugins-config.sort").map()
			end,
			config = function()
				require("plugins-config.sort").config()
			end,
			cmd = "Sort",
		})
		-- readme viewer
		use({
			"4513ECHO/vim-readme-viewer",
			-- cmd = "PackerReadme",
			event = "CmdlineEnter",
			config = function()
				vim.g["readme_viewer#plugin_manager"] = "packer.nvim"
			end,
		})
		-- ╭──────────────────────────────────────────────────────────╮
		-- │                        Git related                       │
		-- ╰──────────────────────────────────────────────────────────╯
		-- Magit-like git plugin
		use({
			"TimUntersberger/neogit",
			setup = function()
				require("plugins-config.neogit").map()
			end,
			config = function()
				require("plugins-config.neogit").config()
			end,
			cmd = "Neogit",
		})
		-- git diff viewer
		use({
			"sindrets/diffview.nvim",
			event = "BufRead",
		})
		-- Add git related info in the signs columns and popups
		use({
			"lewis6991/gitsigns.nvim",
			setup = function()
				require("plugins-config.gitsigns").map()
			end,
			config = function()
				require("plugins-config.gitsigns").config()
			end,
		})
		-- conflict resolve helper
		use({
			"akinsho/git-conflict.nvim",
			config = function()
				require("plugins-config.git-conflict").config()
			end,
			event = "BufRead",
		})
		-- Github editor
		use({
			"pwntester/octo.nvim",
			disable = true,
			config = function()
				require("plugins-config.octo").config()
			end,
		})
		-- gitignore generator
		use({
			"kalvinpearce/gitignore-gen.nvim",
			requires = { { "nvim-lua/plenary.nvim" } },
			cmd = "GitignoreGenerate",
		})
		-- ╭──────────────────────────────────────────────────────────╮
		-- │                           files                          │
		-- ╰──────────────────────────────────────────────────────────╯
		-- search buffer
		use({
			"nvim-pack/nvim-spectre",
			setup = function()
				require("plugins-config.spectre").map()
			end,
			config = function()
				require("plugins-config.spectre").config()
			end,
			module = "spectre",
		})
		-- Automatic tags management
		-- use{ "ludovicchabant/vim-gutentags" },
		-- UI to select things (files, grep results, open buffers...)
		use({
			"nvim-telescope/telescope.nvim",
			requires = {
				-- "echasnovski/mini.nvim", -- for fuzzy sorter
				-- sorter
				{
					"nvim-telescope/telescope-fzf-native.nvim",
					run = "make",
					module = "telescope._extensions.fzf",
				},
				-- file browser
				{
					"nvim-telescope/telescope-file-browser.nvim",
					module = "telescope._extensions.file_browser",
				},
				-- luasnip snippet viewer
				{
					"benfowler/telescope-luasnip.nvim",
					module = "telescope._extensions.luasnip", -- if you wish to lazy-load
				},
				-- refactoring support
				{
					"ThePrimeagen/refactoring.nvim",
					module = "telescope._extensions.refactoring",
				},
				-- zoxide integration
				{
					"jvgrootveld/telescope-zoxide",
					-- module = "telescope._extensions.zoxide",
					requires = { "nvim-lua/popup.nvim", "nvim-lua/plenary.nvim" },
					config = function()
						require("plugins-config.telescope-zoxide").config()
					end,
				},
				-- recent files
				{
					"nvim-telescope/telescope-frecency.nvim",
					requires = { "kkharji/sqlite.lua" }, -- install libsqlite3-dev on Ubuntu
					-- module = "telescope._extensions.frecency",
				},
			},
			setup = function()
				require("plugins-config.telescope").map()
			end,
			config = function()
				require("plugins-config.telescope").config()
			end,
			event = "BufRead",
			module = "telescope",
		})
		-- project manager
		use({
			"ahmedkhalf/project.nvim",
			requires = { "nvim-telescope/telescope.nvim", opt = 1 },
		})
		-- 2-panes file explorer
		-- use({
		-- 	"obaland/vfiler.vim",
		-- 	disable = true,
		-- 	requires = {
		-- 		"obaland/vfiler-column-devicons",
		-- 	},
		-- 	setup = function()
		-- 		require("plugins-config.vfiler").map()
		-- 	end,
		-- 	config = function()
		-- 		require("plugins-config.vfiler").config()
		-- 	end,
		-- 	cmd = "VFiler",
		-- })
		-- full-set file explorer
		use({
			"nvim-neo-tree/neo-tree.nvim",
			branch = "v2.x",
			requires = {
				"nvim-lua/plenary.nvim",
				"kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
				"MunifTanjim/nui.nvim",
				{
					-- only needed if you want to use the commands with "_with_window_picker" suffix
					"s1n7ax/nvim-window-picker",
					tag = "v1.*",
					config = function()
						require("plugins-config.nvim-window-picker").config()
					end,
				},
			},
			setup = function()
				require("plugins-config.neo-tree").map()
			end,
			config = function()
				require("plugins-config.neo-tree").config()
			end,
		})
		-- incremental narrowing filer
		use({
			"conweller/findr.vim",
			setup = function()
				require("plugins-config.findr").map()
			end,
			config = function()
				require("plugins-config.findr").config()
			end,
			cmd = { "Findr", "FindrBuffers", "FinderLocList", "FindQFList" },
		})
		-- anything.el in vim
		-- use({
		-- 	"Shougo/ddu.vim",
		-- 	disable = true,
		-- 	setup = function()
		-- 		require("plugins-config.ddu").map()
		-- 	end,
		-- 	config = function()
		-- 		require("plugins-config.ddu").config()
		-- 	end,
		-- 	requires = {
		-- 		"vim-denops/denops.vim",
		-- 		{ "Shougo/ddu-commands.vim", after = "ddu.vim" },
		-- 		{ "Shougo/ddu-ui-ff", after = "ddu.vim" },
		-- 		{ "Shougo/ddu-ui-filer", after = "ddu.vim" },
		-- 		{ "Shougo/ddu-source-file_rec", after = "ddu.vim" },
		-- 		{ "Shougo/ddu-source-file_old", after = "ddu.vim" },
		-- 		{ "matsui54/ddu-source-file_external", after = "ddu.vim" },
		-- 		{ "kuuote/ddu-source-mr", requires = "lambdalisue/mr.vim", after = "ddu.vim" },
		-- 		{ "shun/ddu-source-buffer", after = "ddu.vim" },
		-- 		{ "shun/ddu-source-rg", after = "ddu.vim" },
		-- 		{ "Shougo/ddu-source-action", after = "ddu.vim" },
		-- 		{ "yuki-yano/ddu-filter-fzf", after = "ddu.vim" },
		-- 		{ "Shougo/ddu-filter-matcher_substring", after = "ddu.vim" },
		-- 		{ "Shougo/ddu-kind-file", after = "ddu.vim" },
		-- 		{ "Shougo/ddu-kind-word", after = "ddu.vim" },
		-- 		{ "Shougo/ddu-column-filename", after = "ddu.vim" },
		-- 		{ "ryota2357/ddu-column-icon_filename", after = "ddu.vim" },
		-- 	},
		-- 	after = "denops.vim",
		-- })
		-- project file anchor
		use({
			"ThePrimeagen/harpoon",
			setup = function()
				require("plugins-config.harpoon").map()
				Lazyload_timer("harpoon", 0)
			end,
			config = function()
				require("plugins-config.harpoon").config()
			end,
		})
		use({
			"cbochs/grapple.nvim",
			disable = true,
			requires = { "nvim-lua/plenary.nvim" },
			setup = function()
				require("plugins-config.grapple").map()
			end,
			config = function()
				require("plugins-config.grapple").config()
			end,
		})
		-- ╭──────────────────────────────────────────────────────────╮
		-- │                       text editing                       │
		-- ╰──────────────────────────────────────────────────────────╯
		-- yank kill-ring
		use({
			"tversteeg/registers.nvim",
			config = function()
				require("plugins-config.registers").config()
			end,
		})
		-- yank cycle
		use({
			"gbprod/yanky.nvim",
			setup = function()
				require("plugins-config.yanky").map()
			end,
			config = function()
				require("plugins-config.yanky").config()
				-- require("plugins-config.yanky").cycle_mode() -- TODO: replace this with nvim-keymap-amend
			end,
			after = "registers.nvim",
		})
		-- Autopair
		use({
			"windwp/nvim-autopairs",
			config = function()
				require("plugins-config.autopairs").config()
			end,
		})
		-- comment box decorator
		use({
			"LudoPinelli/comment-box.nvim",
			setup = function()
				require("plugins-config.comment-box").map()
			end,
			module = "comment-box",
		})
		-- buffer bookmarks
		use({
			"MattesGroeger/vim-bookmarks",
			setup = function()
				require("plugins-config.vim-bookmarks").map()
				require("plugins-config.vim-bookmarks").config() -- options should set before loading
			end,
			event = "BufRead",
		})
		-- find a unique character in each word
		use({
			"unblevable/quick-scope",
			opt = true,
			setup = function()
				vim.g.qs_buftype_blacklist = { "terminal", "nofile" }
				Lazyload_timer("quick-scope")
			end,
		})
		-- split/join lines
		-- use({
		-- 	"AndrewRadev/splitjoin.vim",
		-- 	opt = true,
		-- 	setup = function()
		-- 		Lazyload_timer("splitjoin.vim")
		-- 	end,
		-- })
		-- use({
		-- 	"AckslD/nvim-trevJ.lua",
		-- 	requires = { "nvim-treesitter/nvim-treesitter" },
		-- 	setup = function()
		-- 		require("plugins-config.nvim-trevJ").map()
		-- 	end,
		-- 	config = function()
		-- 		require("plugins-config.nvim-trevJ").config()
		-- 	end,
		-- 	after = { "nvim-treesitter" },
		-- })
		use({
			"Wansmer/treesj",
			requires = {
				"nvim-treesitter/nvim-treesitter",
				-- split/join fallback
				{
					"AndrewRadev/splitjoin.vim",
					cmd = { "SplitjoinSplit", "SplitjoinJoin" },
				},
			},
			config = function()
				require("plugins-config.treesj").config()
			end,
		})
		-- non-lsp formatter
		use({
			"sbdchd/neoformat",
			setup = function()
				require("plugins-config.neoformat").map()
			end,
			cmd = "Neoformat",
		})
		-- easymotion next-level
		use({
			"ggandor/leap.nvim",
			setup = function()
				require("plugins-config.leap").map()
			end,
			config = function()
				require("plugins-config.leap").config()
			end,
			event = "BufRead",
		})
		-- Faster f/f
		-- use({
		-- 	"ggandor/lightspeed.nvim",
		-- 	setup = function()
		-- 		require("plugins-config.lightspeed").map()
		-- 	end,
		-- 	event = "BufRead",
		-- })
		use({
			"ggandor/flit.nvim",
			config = function()
				require("plugins-config.flit").config()
			end,
			after = "leap.nvim",
		})
		-- cross-window remote textobject operation
		use({
			"ggandor/leap-spooky.nvim",
			config = function()
				require("plugins-config.leap-spooky").config()
			end,
		})
		-- surrounding plugin
		use({
			"kylechui/nvim-surround",
			config = function()
				require("plugins-config.nvim-surround").config()
			end,
			event = "BufRead",
		})
		-- substitute operator
		use({
			"gbprod/substitute.nvim",
			config = function()
				require("plugins-config.substitute").config()
			end,
			event = "BufRead",
		})
		-- commenting
		use({
			"numToStr/Comment.nvim",
			setup = function()
				require("plugins-config.comment").map()
			end,
			config = function()
				require("plugins-config.comment").config()
			end,
			event = "BufRead",
		})
		-- multi cursor
		-- use({
		-- 	"mg979/vim-visual-multi",
		-- 	requires = { "kevinhwang91/nvim-hlslens" },
		-- 	opt = true,
		-- 	setup = function()
		-- 		Lazyload_timer("vim-visual-multi")
		-- 		require("plugins-config.vim-visual-multi").map()
		-- 	end,
		-- 	config = function()
		-- 		require("plugins-config.vim-visual-multi").config()
		-- 	end,
		-- })
		use({
			"otavioschwanck/cool-substitute.nvim",
			config = function()
				require("plugins-config.cool-substitute").config()
			end,
		})
		-- tabout
		use({
			"abecodes/tabout.nvim",
			config = function()
				require("plugins-config.tabout").config()
			end,
			event = "InsertEnter",
		})
		-- increment/decrement improved
		use({
			"monaqa/dial.nvim",
			config = function()
				require("plugins-config.dial").config()
				require("plugins-config.dial").map()
			end,
		})
		-- Zen mode
		use({
			"folke/zen-mode.nvim",
			setup = function()
				require("plugins-config.zen-mode").map()
			end,
			config = function()
				require("plugins-config.zen-mode").config()
			end,
			cmd = "ZenMode",
		})
		-- better blockwise visual mode bindings
		use({
			"kana/vim-niceblock",
			event = "BufRead",
		})
		-- ╭──────────────────────────────────────────────────────────╮
		-- │                          themes                          │
		-- ╰──────────────────────────────────────────────────────────╯
		-- set colorscheme per filetype
		use({
			"folke/styler.nvim",
			disable = true,
			config = function()
				require("plugins-config.styler").config()
			end,
		}) -- Theme inspired by Atom
		-- use({ "joshdick/onedark.vim" })
		-- github theme
		use({
			"projekt0n/github-nvim-theme",
			config = function()
				require("plugins-config.github-nvim-theme").config()
			end,
		})
		-- use({
		-- 	"sam4llis/nvim-tundra",
		-- 	disable = true,
		-- 	config = function()
		-- 		require("plugins-config.nvim-tundra").config()
		-- 		-- vim.cmd("colorscheme tundra")
		-- 	end,
		-- })
		-- use({
		-- 	"luisiacc/gruvbox-baby",
		-- 	disable = true,
		-- 	config = function()
		-- 		require("plugins-config.gruvbox-baby").config()
		-- 		-- vim.cmd([[colorscheme gruvbox-baby]])
		-- 	end,
		-- })
		-- catppuccin theme
		-- use({
		-- 	"catppuccin/nvim",
		-- 	as = "catppuccin",
		-- 	disable = true,
		-- })
		-- tokyonight theme
		use({ "folke/tokyonight.nvim" })
		-- nightfox theme
		use({
			"EdenEast/nightfox.nvim",
			config = function()
				require("plugins-config.nightfox").config()
				-- vim.cmd([[colorscheme terafox]])
			end,
		})
		-- Everforest theme
		-- use({
		-- 	"sainnhe/everforest",
		-- 	disable = true,
		-- 	config = function()
		-- 		require("plugins-config.everforest").config()
		-- 		-- vim.cmd([[colorscheme everforest]])
		-- 	end,
		-- 	-- event = "BufRead",
		-- })
		-- gruvbox theme
		-- use({ "eddyekofo94/gruvbox-flat.nvim" })
		-- aquarium theme
		-- use({
		-- 	"FrenzyExists/aquarium-vim",
		-- 	disable = true,
		-- 	config = function()
		-- 		require("plugins-config.aquarium").config()
		-- 		-- vim.cmd([[colorscheme aquarium]])
		-- 	end,
		-- })
		-- low-contrast themes
		-- use({
		-- 	"mcchrish/zenbones.nvim",
		-- 	disable = true,
		-- 	requires = "rktjmp/lush.nvim",
		-- 	config = function()
		-- 		require("plugins-config.zenbones").config()
		-- 		-- vim.cmd([[colorscheme forestbones]])
		-- 	end,
		-- })
		-- use({
		-- 	"rebelot/kanagawa.nvim",
		-- 	disable = true,
		-- 	config = function()
		-- 		require("plugins-config.kanagawa").config()
		-- 		-- vim.cmd([[colorscheme kanagawa]])
		-- 	end,
		-- })
		use({
			"lewpoly/sherbet.nvim",
			config = function()
				require("plugins-config.sherbet").config()
				-- vim.cmd([[colorscheme sherbet]])
			end,
		})
		use({
			"nyoom-engineering/oxocarbon.nvim",
			config = function()
				require("plugins-config.oxocarbon").config()
				-- vim.cmd([[colorscheme sherbet]])
			end,
		})
		-- ╭──────────────────────────────────────────────────────────╮
		-- │                     lines and widgets                    │
		-- ╰──────────────────────────────────────────────────────────╯
		-- tabline
		use({
			"nanozuki/tabby.nvim",
			setup = function()
				require("plugins-config.tabby").map()
			end,
			config = function()
				require("plugins-config.tabby").config()
			end,
		})
		-- Fancier statusline
		use({
			"nvim-lualine/lualine.nvim",
			config = function()
				require("plugins-config.lualine").config()
			end,
			event = "BufRead",
		})
		-- scrollbar with search info
		use({
			"petertriho/nvim-scrollbar",
			config = function()
				require("plugins-config.scrollbar").config()
			end,
			event = "BufRead",
		})
		-- use({
		-- 	"lewis6991/satellite.nvim",
		-- 	disable = true,
		-- 	config = function()
		-- 		require("plugins-config.satellite").config()
		-- 	end,
		-- })
		-- Add indentation guides even on blank lines
		use({
			"lukas-reineke/indent-blankline.nvim",
			config = function()
				require("plugins-config.indent-blankline").config()
			end,
			event = "BufRead",
		})
		-- cursorword highlighting
		-- use({
		-- 	"RRethy/vim-illuminate",
		-- 	config = function()
		-- 		require("plugins-config.vim-illuminate").config()
		-- 	end,
		-- 	disable = true,
		-- 	-- event = "BufRead",
		-- })
		-- small modules package
		use({
			"echasnovski/mini.nvim",
			setup = function()
				require("plugins-config.mini-starter").map()
			end,
			config = function()
				-- greeter
				-- require("plugins-config.mini-starter").config()
				-- animated indent guides
				-- require("plugins-config.mini-indentscope").config()
				-- cursorword highlighting
				-- require("plugins-config.mini-cursorword").config()
				-- targets.vim like textobjects
				require("plugins-config.mini-ai").config()
				-- require("plugins-config.mini-animate").config()
				-- clever-f
				-- require("plugins-config.mini-jump").config()
				-- require("plugins-config.mini-surround").config()
			end,
		})
		-- ╭──────────────────────────────────────────────────────────╮
		-- │                        treesitter                        │
		-- ╰──────────────────────────────────────────────────────────╯
		use({
			"nvim-treesitter/nvim-treesitter",
			config = function()
				require("plugins-config.nvim-treesitter").config()
			end,
			-- event = "VimEnter",
			run = ":TSUpdate",
		})
		-- playground
		use({
			"nvim-treesitter/playground",
			requires = { "nvim-treesitter/nvim-treesitter" },
			after = { "nvim-treesitter" },
		})
		-- fix treesitter indent
		use({
			"yioneko/nvim-yati",
			requires = "nvim-treesitter/nvim-treesitter",
			after = "nvim-treesitter",
		})
		-- Colorize brackets
		use({
			"p00f/nvim-ts-rainbow",
			requires = { "nvim-treesitter/nvim-treesitter" },
			after = "nvim-treesitter",
		})
		-- Limelighting
		use({
			"folke/twilight.nvim",
			requires = { "nvim-treesitter/nvim-treesitter" },
			after = { "nvim-treesitter" },
			setup = function()
				require("plugins-config.twilight").map()
			end,
			config = function()
				require("plugins-config.twilight").config()
			end,
		})
		-- highlight arguments
		use({
			"m-demare/hlargs.nvim",
			requires = { "nvim-treesitter/nvim-treesitter" },
			after = "nvim-treesitter",
			config = function()
				require("plugins-config.hlargs").config()
			end,
		})
		-- treesitter-based context viewer
		use({
			"lewis6991/nvim-treesitter-context",
			requires = { "nvim-treesitter/nvim-treesitter" },
			after = { "nvim-treesitter" },
			config = function()
				require("plugins-config.treesitter-context").config()
			end,
		})
		-- Additional textobjects for treesitter
		use({
			"nvim-treesitter/nvim-treesitter-textobjects",
			requires = { "nvim-treesitter/nvim-treesitter" },
			after = { "nvim-treesitter" },
		})
		-- indent textobjects
		use({
			"kiyoon/treesitter-indent-object.nvim",
			config = function()
				require("plugins-config.treesitter-indent-object").config()
				require("plugins-config.treesitter-indent-object").map()
			end,
			after = { "nvim-treesitter" },
		})
		-- wisely add `end` of block
		use({
			"RRethy/nvim-treesitter-endwise",
			requires = { "nvim-treesitter/nvim-treesitter" },
			after = { "nvim-treesitter" },
		})
		-- html autotag
		use({
			"windwp/nvim-ts-autotag",
			requires = { "nvim-treesitter/nvim-treesitter" },
			after = { "nvim-treesitter" },
		})
		-- textobject unit-wise highlighter/textobject
		use({
			"David-Kunz/treesitter-unit",
			requires = { "nvim-treesitter/nvim-treesitter" },
			after = { "nvim-treesitter" },
			config = function()
				require("plugins-config.treesitter-unit").config()
			end,
		})
		-- syntax-based surfing
		use({
			"ziontee113/syntax-tree-surfer",
			requires = { "nvim-treesitter/nvim-treesitter" },
			after = { "nvim-treesitter" },
			config = function()
				require("plugins-config.syntax-tree-surfer").map()
				require("plugins-config.syntax-tree-surfer").config()
			end,
		})
		-- select textobject with hints
		use({
			"mfussenegger/nvim-treehopper",
			requires = { "nvim-treesitter/nvim-treesitter" },
			after = { "nvim-treesitter" },
			setup = function()
				require("plugins-config.nvim-treehopper").map()
			end,
			config = function()
				require("plugins-config.nvim-treehopper").config()
			end,
		})
		-- Generate annotation
		use({
			"danymat/neogen",
			after = { "nvim-treesitter" },
			requires = { "nvim-treesitter/nvim-treesitter" },
			config = function()
				require("plugins-config.neogen").config()
			end,
		})
		-- dim unused variables and functions
		use({
			"zbirenbaum/neodim",
			config = function()
				require("plugins-config.neodim").config()
			end,
		})
		-- ╭──────────────────────────────────────────────────────────╮
		-- │                            LSP                           │
		-- ╰──────────────────────────────────────────────────────────╯
		-- Collection of configurations for built-in LSP client
		use({ "neovim/nvim-lspconfig" })
		--  To Install LSP Automatically with LspInstall
		-- use({ "williamboman/nvim-lsp-installer" })
		use({
			"williamboman/mason.nvim",
			requires = {
				"neovim/nvim-lspconfig",
				{ "williamboman/mason-lspconfig.nvim" },
				{ "WhoIsSethDaniel/mason-tool-installer.nvim" },
			},
		})

		-- async formatting with LSP
		use({ "lukas-reineke/lsp-format.nvim" })
		-- rust lsp tools
		use({
			"simrat39/rust-tools.nvim",
			requires = { "neovim/nvim-lspconfig" },
		})
		-- clangd lsp tools
		use({
			"p00f/clangd_extensions.nvim",
			requires = { "neovim/nvim-lspconfig" },
		})
		-- show signature guides on type
		use({
			"ray-x/lsp_signature.nvim",
			config = function()
				require("plugins-config.lsp_signature").config()
			end,
		})
		-- code outline
		use({
			"stevearc/aerial.nvim",
			setup = function()
				require("plugins-config.aerial").map()
			end,
			config = function()
				require("plugins-config.aerial").config()
			end,
			-- module = "aerial",
			-- event = "LspAttach",
		})
		-- Inject Format, Diagnostics, Code Actions to Lsp
		use({ "jose-elias-alvarez/null-ls.nvim" })
		-- breadcrumb
		use({
			"SmiteshP/nvim-navic",
			requires = { "neovim/nvim-lspconfig" },
			config = function()
				require("plugins-config.nvim-navic").config()
			end,
			module = "nvim-navic",
		})
		-- show lsp progress
		use({
			"j-hui/fidget.nvim",
			config = function()
				require("plugins-config.fidget").config()
			end,
			event = "BufRead",
		})
		-- show lsp diagnostics on top or bottom
		use({
			"Mofiqul/trld.nvim",
			config = function()
				require("plugins-config.trld").config()
			end,
			event = "BufRead",
		})
		-- show lsp diagnostics inside code
		use({
			"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
			config = function()
				require("plugins-config.lsp_lines").config()
			end,
			event = "BufRead",
		})
		-- ╭──────────────────────────────────────────────────────────╮
		-- │                      Autocompletion                      │
		-- ╰──────────────────────────────────────────────────────────╯
		use({
			"hrsh7th/nvim-cmp",
			config = function()
				require("plugins-config.nvim-cmp").config()
			end,
			requires = {
				-- -- cmp devicons appearance dependency
				{ "onsails/lspkind-nvim" },
				-- -- cmp plugins
				{ "hrsh7th/cmp-nvim-lsp" },
				{ "saadparwaiz1/cmp_luasnip", after = "nvim-cmp" },
				{ "hrsh7th/cmp-path", after = "nvim-cmp" },
				{ "hrsh7th/cmp-nvim-lsp-document-symbol", after = "nvim-cmp" },
				{ "hrsh7th/cmp-buffer", module = "cmp_buffer" },
				{ "hrsh7th/cmp-cmdline", after = "nvim-cmp" },
				{ "ray-x/cmp-treesitter", after = "nvim-cmp" },
				{ "octaltree/cmp-look", after = "nvim-cmp" },
				{ "hrsh7th/cmp-nvim-lua", after = "nvim-cmp" },
				{ "lukas-reineke/cmp-rg", after = "nvim-cmp" },
				{ "lukas-reineke/cmp-under-comparator" },
				-- { "hrsh7th/cmp-copilot" },
				-- { "zbirenbaum/copilot-cmp", after = "copilot.lua" },
			},
			-- event = { "BufRead" },
		})
		--------------------------------------------------------------------------------
		-- Snippets plugin
		use({
			"L3MON4D3/LuaSnip",
			requires = { "hrsh7th/nvim-cmp" },
			module = "luasnip",
		})
		-- snippets bundle
		use({
			"rafamadriz/friendly-snippets",
			requires = { "hrsh7th/nvim-cmp", "L3MON4D3/LuaSnip" },
			event = "InsertEnter",
			after = "nvim-cmp",
		})
		-- ╭──────────────────────────────────────────────────────────╮
		-- │                          debug                           │
		-- ╰──────────────────────────────────────────────────────────╯
		-- Debug Adapter Protocol
		use({
			"mfussenegger/nvim-dap",
			opt = true,
			setup = function()
				require("plugins-config.dap").map()
				Lazyload_timer("nvim-dap")
			end,
			config = function()
				require("plugins-config.dap").config()
			end,
		})
		-- DAP UI
		use({
			"rcarriga/nvim-dap-ui",
			requires = { "mfussenegger/nvim-dap" },
			module = "dapui",
		})
		-- DAP vitrual text
		use({
			"theHamsta/nvim-dap-virtual-text",
			requires = { "mfussenegger/nvim-dap" },
			module = "nvim-dap-virtual-text",
		})
		-- task runner and job management
		-- TODO: migrate from asyncrun/asynctasks
		use({
			"stevearc/overseer.nvim",
			setup = function()
				require("plugins-config.overseer").map()
			end,
			config = function()
				require("plugins-config.overseer").config()
			end,
		})
		-- block code snippet runner
		-- use({
		-- 	"michaelb/sniprun",
		-- 	disable = true,
		-- 	run = "bash ./install.sh",
		-- 	event = "BufRead",
		-- })
		-- test framework runner
		use({
			"rcarriga/neotest",
			requires = {
				-- dependencies
				{ "nvim-lua/plenary.nvim" },
				{ "nvim-treesitter/nvim-treesitter" },
				{ "vim-test/vim-test" },
				-- runners
				{ "rcarriga/neotest-python", module = "neotest-python" },
				{ "rcarriga/neotest-plenary", module = "neotest-plenary" },
				{ "rcarriga/neotest-vim-test", module = "neotest-vim-test" },
			},
			setup = function()
				require("plugins-config.neotest").map()
			end,
			config = function()
				require("plugins-config.neotest").config()
			end,
		})
		-- ╭──────────────────────────────────────────────────────────╮
		-- │                           Misc                           │
		-- ╰──────────────────────────────────────────────────────────╯
		-- Notification balloon
		use({
			"rcarriga/nvim-notify",
			config = function()
				require("plugins-config.notify").config()
			end,
		})
		-- folding
		use({
			"anuvyklack/pretty-fold.nvim",
			config = function()
				require("plugins-config.pretty-fold").config()
			end,
			event = "BufRead",
		})
		-- color highlighter
		use({
			"norcalli/nvim-colorizer.lua",
			config = function()
				require("plugins-config.colorizer").config()
			end,
			-- TODO: test ccc.nvim
		})
		-- Discover available code action like VSCode
		use({
			"kosayoda/nvim-lightbulb",
			config = function()
				require("plugins-config.lightbulb").config()
			end,
		})
		-- preview code actions
		use({
			"aznhe21/actions-preview.nvim",
			config = function()
				require("plugins-config.actions-preview").config()
			end,
		})
		-- Show matched information in search
		use({
			"kevinhwang91/nvim-hlslens",
			-- requires = { "haya14busa/vim-asterisk" }, -- better asterisk
			setup = function()
				require("plugins-config.hlslens").map()
				-- require("plugins-config.hlslens").map_with_vim_asterisk()
			end,
			config = function()
				-- require("plugins-config.hlslens").config() --loaded by nvim-scrollbar
			end,
			module = "hlslens",
		})
		-- Show keybindings
		-- use({
		-- 	"folke/which-key.nvim",
		-- 	disable = true,
		-- 	config = function()
		-- 		require("plugins-config.which-key").config()
		-- 	end,
		-- 	opt = true,
		-- 	setup = function()
		-- 		Lazyload_timer("which-key.nvim")
		-- 	end,
		-- })
		-- Problem view
		use({
			"folke/trouble.nvim",
			opt = true,
			setup = function()
				require("plugins-config.trouble").map()
				Lazyload_timer("trouble.nvim")
			end,
			config = function()
				require("plugins-config.trouble").config()
			end,
		})
		-- todo highlight
		use({
			"folke/todo-comments.nvim",
			setup = function()
				require("plugins-config.todo-comments").map()
			end,
			config = function()
				require("plugins-config.todo-comments").config()
			end,
		})
		-- Better quickfix
		use({
			"kevinhwang91/nvim-bqf",
			event = "BufRead",
		})
		use({
			"stevearc/qf_helper.nvim",
			setup = function()
				require("plugins-config.qf_helper").map()
			end,
			config = function()
				require("plugins-config.qf_helper").config()
			end,
			event = "BufRead",
		})
		-- prettier quickfix
		use({
			"https://gitlab.com/yorickpeterse/nvim-pqf",
			config = function()
				require("pqf").setup()
			end,
			event = "BufRead",
		})
		-- Batch editing quickfix
		use({
			"gabrielpoca/replacer.nvim",
			module = "replacer",
		})
		-- terminal integration
		use({
			"akinsho/toggleterm.nvim",
			setup = function()
				require("plugins-config.toggleterm").map()
			end,
			config = function()
				require("plugins-config.toggleterm").config()
			end,
			event = "BufWinEnter",
		})
		-- open url / search in browser,
		use({
			"tyru/open-browser.vim",
			disable = true,
			setup = function()
				require("plugins-config.open-browser").map()
			end,
			event = "BufRead",
		})
		-- cht.sh cheetsheet
		use({
			"Djancyp/cheat-sheet",
			disable = true,
			cmd = "CheatSH",
		})
		-- haskell syntax highlighting
		use({
			"neovimhaskell/haskell-vim",
			setup = function()
				require("plugins-config.haskell-vim").config()
			end,
			ft = "haskell",
		})
		-- json viewer
		use({
			"gennaro-tedesco/nvim-jqx",
			ft = "json",
		})
		-- javascript package manager helper
		use({
			"vuki656/package-info.nvim",
			config = function()
				require("package-info").setup()
			end,
			ft = "json",
		})
		-- cargo (Rust's package manager) file editing
		use({
			"saecki/crates.nvim",
			requires = { "nvim-lua/plenary.nvim" },
			ft = "toml",
		})
		-- SQL keyword uppercased
		use({
			"jsborjesson/vim-uppercase-sql",
			ft = "sql",
		})
		-- docker manager
		-- use({
		-- 	"skanehira/denops-docker.vim",
		-- 	requires = "vim-denops/denops.vim",
		-- 	after = "denops.vim",
		-- })
		-- launch VSCode with current workspace
		use({
			"elijahmanor/export-to-vscode.nvim",
			module = "export-to-vscode",
			setup = function()
				vim.api.nvim_create_user_command("Code", "lua require('export-to-vscode').launch()", {})
			end,
		})
		-- cpbooster, competitive programming cli tool
		use({
			"searleser97/cpbooster.vim",
			opt = true,
			setup = function()
				Lazyload_timer("cpbooster.vim", 500)
			end,
		})
		-- competitive programming helper
		use({
			"xeluxee/competitest.nvim",
			requires = "MunifTanjim/nui.nvim",
			config = function()
				require("plugins-config.competitest").config()
			end,
		})
		if packer_bootstrap then
			require("packer").sync()
		end
	end,
	config = {
		display = {
			open_fn = require("packer.util").float, -- floating window
		},
		-- PackerProfile
		profile = {
			enable = true,
			threshold = 1, -- the amount in ms that a plugins load time must be over for it to be included in the profile
		},
		git = {
			clone_timeout = 300,
			subcommands = {
				update = "pull --ff-only --progress --rebase=true",
			},
		},
	},
})

-- ╭──────────────────────────────────────────────────────────╮
-- │                      plugin config                       │
-- ╰──────────────────────────────────────────────────────────╯

-- mapping sugar syntax
require("mapx").setup({ global = true }) -- global keymap helper
