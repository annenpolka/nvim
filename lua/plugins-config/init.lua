-- optimize loading
require("impatient").enable_profile()
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
		use({ "nathom/filetype.nvim" })
		-- improved matchit
		use({
			disable = true,
			"andymass/vim-matchup",
			setup = function()
				require("plugins-config.matchup").config()
			end,
		})
		-- faster matchparen
		use({
			"monkoose/matchparen.nvim",
			config = function()
				require("plugins-config.matchparen").config()
			end,
		})
		-- fix cursorhold performance problem, set dedicated updatetime
		use({
			"antoinemadec/FixCursorHold.nvim",
			setup = function()
				vim.g.cursorhold_updatetime = 200
			end,
		})
		-- major startuptime
		use({ "dstein64/vim-startuptime" })
		-- ╭──────────────────────────────────────────────────────────╮
		-- │                    runtime, dependency                   │
		-- ╰──────────────────────────────────────────────────────────╯
		use({
			"vim-denops/denops.vim",
			event = "BufRead",
		})
		use({ "kyazdani42/nvim-web-devicons" })
		use({ "nvim-lua/plenary.nvim" })
		use({ "MunifTanjim/nui.nvim" })
		use({ "kamykn/popup-menu.nvim" })
		-- fzf
		use({
			"junegunn/fzf",
			run = function()
				fn["fzf#install"]()
			end,
		})
		-- mapping helper functions
		use({ "b0o/mapx.nvim" })
		-- extended dot repeat
		use({ "tpope/vim-repeat" })
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
		})
		-- UI for code action, rename
		use({
			"CosmicNvim/cosmic-ui",
			requires = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
			config = function()
				require("cosmic-ui").setup()
			end,
			module = "cosmic-ui",
		})
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
			"Shatur/neovim-session-manager",
			config = function()
				require("plugins-config.neovim-session-manager").config()
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
		-- stabilize open/close window behavior
		use({
			"luukvbaal/stabilize.nvim",
			config = function()
				require("stabilize").setup()
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
			event = "BufRead",
		})
		-- automatic indent detection
		use({ "tpope/vim-sleuth" })
		-- Better Escape
		use({
			"max397574/better-escape.nvim",
			config = function()
				require("plugins-config.better-escape").config()
			end,
			event = "InsertEnter",
		})
		-- mouse gestures
		use({
			disable = true,
			"notomo/gesture.nvim",
			opt = true,
			setup = function()
				require("plugins-config.gesture").map()
				Lazyload_timer("gesture.nvim")
			end,
			config = function()
				require("plugins-config.gesture").config()
			end,
		})
		-- readline keybindings in insert mode
		use({
			"tpope/vim-rsi",
			event = "InsertEnter",
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
			config = function()
				require("mkdir")
			end,
			event = "BufRead",
		})
		-- open file in terminal with new tab, not nested window
		use({
			"lambdalisue/guise.vim",
			requires = "vim-denops/denops.vim",
			after = "denops.vim",
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
		-- git diff viewer
		use({
			"sindrets/diffview.nvim",
			module = "diffview",
		})
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
		-- full-featured git plugin
		use({
			"lambdalisue/gin.vim",
			requires = {
				"vim-denops/denops.vim",
			},
			after = { "denops.vim" },
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
			config = function()
				require("plugins-config.octo").config()
			end,
			event = "CmdlineEnter",
		})
		-- git permalink getter
		use({
			"ruifm/gitlinker.nvim",
			requires = "nvim-lua/plenary.nvim",
			config = function()
				require("plugins-config.gitlinker").config()
			end,
			event = "BufRead",
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
				"echasnovski/mini.nvim", -- for fuzzy sorter
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
				-- frecency (frequency/recent)
				{
					"nvim-telescope/telescope-frecency.nvim",
					requires = { "nvim-telescope/telescope.nvim", "tami5/sqlite.lua" },
					module = "telescope._extensions.frecency",
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
			},
			setup = function()
				require("plugins-config.telescope").map()
			end,
			config = function()
				require("plugins-config.telescope").config()
			end,
			event = "BufRead",
		})
		-- project manager
		use({
			"ahmedkhalf/project.nvim",
			requires = { "nvim-telescope/telescope.nvim", opt = 1 },
		})
		-- fuzzy find many things
		use({
			disable = true,
			"Shougo/ddu.vim",
			config = function()
				require("plugins-config.ddu").config()
			end,
			requires = {
				"vim-denops/denops.vim",
				"Shougo/ddu-commands.vim",
				"Shougo/ddu-ui-ff",
				"Shougo/ddu-source-file_rec",
				"shun/ddu-source-buffer",
				"shun/ddu-source-rg",
				"Shougo/ddu-source-action",
				"yuki-yano/ddu-filter-fzf",
				"Shougo/ddu-filter-matcher_substring",
				"Shougo/ddu-kind-file",
				"Shougo/ddu-kind-word",
			},
			after = "denops.vim",
		})
		-- fzf UI
		use({
			disable = true,
			"ibhagwan/fzf-lua",
			-- optional for icon support
			requires = { "kyazdani42/nvim-web-devicons" },
		})
		-- 2-panes file explorer
		use({
			"obaland/vfiler.vim",
			requires = {
				"obaland/vfiler-column-devicons",
			},
			setup = function()
				require("plugins-config.vfiler").map()
			end,
			config = function()
				require("plugins-config.vfiler").config()
			end,
			cmd = "VFiler",
		})
		-- text-based filesystem edit
		use({
			"elihunter173/dirbuf.nvim",
			setup = function()
				require("plugins-config.dirbuf").map()
			end,
			config = function()
				require("plugins-config.dirbuf").config()
			end,
			cmd = "Dirbuf",
		})
		-- ╭──────────────────────────────────────────────────────────╮
		-- │                       text editing                       │
		-- ╰──────────────────────────────────────────────────────────╯
		-- yank kill-ring
		use({
			"tversteeg/registers.nvim",
			setup = function()
				require("plugins-config.registers").config()
			end,
			event = "BufRead",
		})
		-- yank cycle
		use({
			"gbprod/yanky.nvim",
			setup = function()
				require("plugins-config.yanky").map()
			end,
			config = function()
				require("plugins-config.yanky").config()
			end,
			after = "registers.nvim",
		})
		-- Autopair
		use({
			"windwp/nvim-autopairs",
			opt = true,
			setup = function()
				Lazyload_timer("nvim-autopairs", 100)
			end,
			config = function()
				require("plugins-config.autopairs").config()
			end,
		})
		-- comment eyecandies
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
		-- grip function and its name
		use({
			"Matt-A-Bennett/vim-surround-funk",
			opt = true,
			setup = function()
				require("plugins-config.surround-funk").map()
				Lazyload_timer("vim-surround-funk")
			end,
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
		use({
			"AndrewRadev/splitjoin.vim",
			opt = true,
			setup = function()
				Lazyload_timer("splitjoin.vim")
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
		-- Faster f/f
		use({
			disable = true,
			"ggandor/lightspeed.nvim",
			setup = function()
				require("plugins-config.lightspeed").map()
			end,
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
		-- custom textobjects
		use({
			"kana/vim-textobj-user",
			requires = {
				-- method chaining
				{ "D4KU/vim-textobj-chainmember", after = "vim-textobj-user" },
				-- punctuation
				-- "beloglazov/vim-textobj-punctuation",
			},
			setup = function()
				require("plugins-config.textobj-user").map()
			end,
			event = "BufRead",
		})
		-- go to scope's edge
		use({
			"haya14busa/vim-edgemotion",
			setup = function()
				require("plugins-config.edgemotion").map()
			end,
			event = "BufRead",
		})
		-- surrounding plugin
		use({
			"machakann/vim-sandwich",
			setup = function()
				require("plugins-config.sandwich").map()
			end,
			config = function()
				require("plugins-config.sandwich").config()
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
		use({
			"mg979/vim-visual-multi",
			opt = true,
			setup = function()
				Lazyload_timer("vim-visual-multi")
			end,
		})
		-- abbreviation expansion, typo correction
		use({
			"Pocco81/AbbrevMan.nvim",
			config = function()
				require("plugins-config.abbrevman").config()
			end,
		})
		-- spellcheck
		use({
			"kamykn/spelunker.vim",
			config = function()
				require("plugins-config.spelunker").config()
			end,
			event = "BufRead",
		})
		-- tabout
		use({
			"abecodes/tabout.nvim",
			config = function()
				require("plugins-config.tabout").config()
			end,
			event = "InsertEnter",
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
		-- region buffer window
		use({
			"hoschi/yode-nvim",
			require = {
				"nvim-lua/plenary.nvim",
			},
			setup = function()
				require("plugins-config.yode").map()
			end,
			config = function()
				require("plugins-config.yode").config()
			end,
			event = "BufRead",
		})
		-- better blockwise visual mode bindings
		use({
			"kana/vim-niceblock",
			event = "BufRead",
		})
		-- insert comma or semi-colon
		use({
			"lfilho/cosco.vim",
			event = "BufRead",
		})
		-- wiser paste
		use({
			disable = true,
			"AckslD/nvim-anywise-reg.lua",
			config = function()
				require("plugins-config.anywise-reg").config()
			end,
			event = "BufRead",
		})
		-- ╭──────────────────────────────────────────────────────────╮
		-- │                          themes                          │
		-- ╰──────────────────────────────────────────────────────────╯
		-- Theme inspired by Atom
		-- use({ "joshdick/onedark.vim" })
		-- github theme
		-- use{ "projekt0n/github-nvim-theme" },
		-- catppuccin theme
		-- use({ "catppuccin/nvim", as = "catppuccin" })
		-- tokyonight theme
		use({ "folke/tokyonight.nvim" })
		-- nightfox theme
		use({
			"EdenEast/nightfox.nvim",
			config = function()
				require("plugins-config.nightfox").config()
				vim.cmd([[colorscheme terafox]])
			end,
		})
		-- Everforest theme
		use({
			"sainnhe/everforest",
			config = function()
				require("plugins-config.everforest").config()
				-- vim.cmd([[colorscheme everforest]])
			end,
			-- event = "BufRead",
		})
		-- gruvbox theme
		-- use({ "eddyekofo94/gruvbox-flat.nvim" })
		-- aquarium theme
		use({
			"FrenzyExists/aquarium-vim",
			disable = true,
			config = function()
				require("plugins-config.aquarium").config()
				-- vim.cmd([[colorscheme aquarium]])
			end,
		})
		-- low-contrast themes
		use({
			"mcchrish/zenbones.nvim",
			disable = true,
			requires = "rktjmp/lush.nvim",
			config = function()
				require("plugins-config.zenbones").config()
				-- vim.cmd([[colorscheme forestbones]])
			end,
		})
		use({
			"rebelot/kanagawa.nvim",
			disable = true,
			config = function()
				require("plugins-config.kanagawa").config()
				-- vim.cmd([[colorscheme kanagawa]])
			end,
		})
		use({
			"lewpoly/sherbet.nvim",
			config = function()
				-- vim.cmd([[colorscheme sherbet]])
				-- vim.cmd("hi TabLine gui=NONE")
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
			after = "nightfox.nvim",
		})
		-- Fancier statusline
		use({
			"nvim-lualine/lualine.nvim",
			config = function()
				require("plugins-config.lualine").config()
			end,
			event = "BufRead",
		})
		-- dedicated statusline with global one
		use({
			disable = true,
			"b0o/incline.nvim",
			config = function()
				require("plugins-config.incline").config()
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
		-- Add indentation guides even on blank lines
		use({
			"lukas-reineke/indent-blankline.nvim",
			config = function()
				require("plugins-config.indent-blankline").config()
			end,
			event = "BufRead",
		})
		-- small modules package
		use({
			"echasnovski/mini.nvim",
			config = function()
				-- greeter
				require("plugins-config.mini-starter").config()
				-- animated indent guides
				require("plugins-config.mini-indentscope").config()
				-- cursorword highlighting
				require("plugins-config.mini-cursorword").config()
				-- clever-f
				require("plugins-config.mini-jump").config()
				-- require("plugins-config.mini-surround").config()
			end,
		})
		-- show regex info
		use({
			"bennypowers/nvim-regexplainer",
			config = function()
				require("plugins-config.regexplainer").config()
			end,
			requires = {
				"nvim-lua/plenary.nvim",
				"MunifTanjim/nui.nvim",
			},
			event = "BufRead",
		})
		-- code action modal
		use({
			disable = true,
			"weilbith/nvim-code-action-menu",
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
		-- fix indent
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
			disable = true,
			"lewis6991/nvim-treesitter-context",
			requires = { "nvim-treesitter/nvim-treesitter" },
			after = { "nvim-treesitter" },
			config = function()
				require("plugins-config.treesitter-context").config()
			end,
		})
		-- breadcrumb
		use({
			"SmiteshP/nvim-gps",
			requires = { "nvim-treesitter/nvim-treesitter" },
			after = { "nvim-treesitter" },
			config = function()
				require("plugins-config.nvim-gps").config()
			end,
		})
		-- Additional textobjects for treesitter
		use({
			"nvim-treesitter/nvim-treesitter-textobjects",
			requires = { "nvim-treesitter/nvim-treesitter" },
			after = { "nvim-treesitter" },
		})
		-- html autotag
		use({
			"windwp/nvim-ts-autotag",
			requires = { "nvim-treesitter/nvim-treesitter" },
			after = { "nvim-treesitter" },
		})
		-- textobject unit helper
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
			setup = function()
				require("plugins-config.syntax-tree-surfer").map()
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
		-- Bracket Lens-like plugin
		use({
			"haringsrob/nvim_context_vt",
			after = { "nvim-treesitter" },
			requires = { "nvim-treesitter/nvim-treesitter" },
			config = function()
				require("plugins-config.context_vt").config()
			end,
		})
		-- dim unused variables and functions
		use({
			"narutoxy/dim.lua",
			requires = { "nvim-treesitter/nvim-treesitter", "neovim/nvim-lspconfig" },
			after = { "nvim-treesitter" },
			config = function()
				require("dim").setup({})
			end,
		})
		-- ╭──────────────────────────────────────────────────────────╮
		-- │                            LSP                           │
		-- ╰──────────────────────────────────────────────────────────╯
		-- Collection of configurations for built-in LSP client
		use({ "neovim/nvim-lspconfig" })
		--  To Install LSP Automatically with LspInstall
		use({ "williamboman/nvim-lsp-installer" })

		-- async formatting
		use({
			"lukas-reineke/lsp-format.nvim",
		})
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
			config = function()
				require("plugins-config.aerial").config()
			end,
			module = "aerial",
		})
		-- Inject Format, Diagnostics, Code Actions to Lsp
		use({ "jose-elias-alvarez/null-ls.nvim" })
		use({ "PlatyPew/format-installer.nvim" })
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
				{ "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp" },
				{ "saadparwaiz1/cmp_luasnip", after = "nvim-cmp" },
				{ "hrsh7th/cmp-path", after = "nvim-cmp" },
				{ "hrsh7th/cmp-nvim-lsp-document-symbol", after = "nvim-cmp" },
				{ "hrsh7th/cmp-buffer", after = "nvim-cmp" },
				{ "hrsh7th/cmp-cmdline", after = "nvim-cmp" },
				{ "ray-x/cmp-treesitter", after = "nvim-cmp" },
				{ "octaltree/cmp-look", after = "nvim-cmp" },
				{ "hrsh7th/cmp-nvim-lua", after = "nvim-cmp" },
				{ "lukas-reineke/cmp-rg", after = "nvim-cmp" },
				{ "lukas-reineke/cmp-under-comparator" },
				-- "hrsh7th/cmp-copilot",
				{ "zbirenbaum/copilot-cmp", after = "nvim-cmp" },
			},
			event = { "BufRead" },
		})
		--------------------------------------------------------------------------------
		-- ddc.vim, denops-based completion
		use({
			disable = true, -- enable when ddc is ready
			"Shougo/ddc.vim",
			requires = {
				"vim-denops/denops.vim",
				-- non-native completion menu
				"Shougo/pum.vim",
				-- show candidates' docs with floating window
				"matsui54/denops-popup-preview.vim",
				-- matchers
				"tani/ddc-fuzzy",
				-- sources
				"Shougo/ddc-nvim-lsp",
				"Shougo/ddc-around",
				"matsui54/ddc-buffer",
				"LumaKernel/ddc-file",
				-- snippets
				"hrsh7th/vim-vsnip",
				"hrsh7th/vim-vsnip-integ",
			},
			setup = function()
				require("plugins-config.ddc").map()
			end,
			config = function()
				require("plugins-config.ddc").config()
			end,
		})
		--------------------------------------------------------------------------------
		-- github copilot
		use({
			"github/copilot.vim",
			setup = function()
				require("plugins-config.copilot").config()
			end,
			cmd = "Copilot",
		})
		use({
			"zbirenbaum/copilot.lua",
			event = "BufRead",
			config = function()
				vim.schedule(function()
					require("copilot").setup()
				end)
			end,
		})
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
			after = "nvim-dap",
		})
		-- vitrual text
		use({
			"theHamsta/nvim-dap-virtual-text",
			requires = { "mfussenegger/nvim-dap" },
			after = "nvim-dap",
		})
		-- async task runners
		use({
			"skywind3000/asyncrun.vim",
			event = "BufRead",
		})
		use({
			"skywind3000/asynctasks.vim",
			requires = { "skywind3000/asyncrun.vim" },
			after = "asyncrun.vim",
		})
		-- block code snippet runner
		use({
			"michaelb/sniprun",
			run = "bash ./install.sh",
			event = "BufRead",
		})
		-- test framework runner
		use({
			"klen/nvim-test",
			config = function()
				require("plugins-config.nvim-test").config()
			end,
			cmd = {
				"TestNearest",
				"TestFile",
				"TestSuite",
				"TestLast",
			},
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
		})
		-- Discover available code action like VSCode
		use({
			"kosayoda/nvim-lightbulb",
			config = function()
				require("plugins-config.lightbulb").config()
			end,
		})
		-- Show matched information in search
		use({
			"kevinhwang91/nvim-hlslens",
			setup = function()
				require("plugins-config.hlslens").map()
			end,
			config = function()
				require("plugins-config.hlslens").config()
			end,
			event = "BufRead",
		})
		-- Show keybindings
		use({
			"folke/which-key.nvim",
			config = function()
				require("plugins-config.which-key").config()
			end,
			opt = true,
			setup = function()
				Lazyload_timer("which-key.nvim")
			end,
		})
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
			-- "folke/todo-comments.nvim",
			"robertgzr/todo-comments.nvim", -- PR of commandline window error
			setup = function()
				require("plugins-config.todo-comments").map()
			end,
			config = function()
				require("plugins-config.todo-comments").config()
			end,
		})
		-- project file anchor
		use({
			"ThePrimeagen/harpoon",
			opt = true,
			setup = function()
				require("plugins-config.harpoon").map()
				Lazyload_timer("harpoon", 0)
			end,
			config = function()
				require("plugins-config.harpoon").config()
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
		-- translator
		use({
			"voldikss/vim-translator",
			setup = function()
				require("plugins-config.translator").map()
			end,
			config = function()
				require("plugins-config.translator").config()
			end,
			cmd = { "TranslateW", "TranslateH" },
		})
		-- open url / search in browser,
		use({
			"tyru/open-browser.vim",
			setup = function()
				require("plugins-config.open-browser").map()
			end,
			event = "BufRead",
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
		-- cargo package manager helper
		use({
			"saecki/crates.nvim",
			requires = { "nvim-lua/plenary.nvim" },
			ft = "toml",
		})
		-- sql keyword uppercased
		use({
			"jsborjesson/vim-uppercase-sql",
			ft = "sql",
		})
		-- docker manager
		use({
			"skanehira/denops-docker.vim",
			requires = "vim-denops/denops.vim",
			after = "denops.vim",
		})
		-- cpbooster, competitive programming cli tool
		use({
			"searleser97/cpbooster.vim",
			opt = true,
			setup = function()
				Lazyload_timer("cpbooster.vim", 500)
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
	},
})

-- ╭──────────────────────────────────────────────────────────╮
-- │                      plugin config                       │
-- ╰──────────────────────────────────────────────────────────╯

-- mapping sugar syntax
require("mapx").setup({ global = true }) -- global keymap helper
