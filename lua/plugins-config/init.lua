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
vim.cmd([[
	augroup PackerAug
		autocmd!
		autocmd BufWritePost init.lua PackerCompile
	augroup END
	]])

-- load plugin after entering vim ui
-- FIXME: This shouldn't be global, but this won't work with local keyword
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
		-- ╭──────────────────────────────────────────────────────────╮
		-- │                    runtime, dependency                   │
		-- ╰──────────────────────────────────────────────────────────╯
		use({ "kyazdani42/nvim-web-devicons" })
		use({ "nvim-lua/plenary.nvim" })
		use({ "MunifTanjim/nui.nvim" })
		use({ "kamykn/popup-menu.nvim" })
		-- use{ "vim-denops/denops.vim" },
		-- fzf
		use({
			"junegunn/fzf",
			run = function()
				vim.fn["fzf#install"]()
			end,
		})
		-- mapping helper functions
		use({ "b0o/mapx.nvim" })
		---------------------------------------------------------------------------------
		-- ╭──────────────────────────────────────────────────────────╮
		-- │                          Utility                         │
		-- ╰──────────────────────────────────────────────────────────╯
		-- fix cursorhold performance problem
		use({ "antoinemadec/FixCursorHold.nvim" })
		-- UI overhaul
		use({
			"stevearc/dressing.nvim",
			config = function()
				require("plugins-config.dressing").config()
			end,
		})
		-- sudo
		use({
			"lambdalisue/suda.vim",
			cmd = { "SudaWrite", "SudaRead" },
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
			cmd = { "Sayonara", "Sayonara!" },
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
		-- Better line number jump with peek
		use({
			"nacro90/numb.nvim",
			config = function()
				require("plugins-config.numb").config()
			end,
			event = "CmdlineEnter",
		})
		-- autosave
		use({
			"Pocco81/AutoSave.nvim",
			config = function()
				require("plugins-config.autosave").config()
			end,
			event = "BufWinEnter",
		})
		-- mouse gestures
		use({
			"notomo/gesture.nvim",
			config = function()
				require("plugins-config.gesture").config()
			end,
			event = "BufWinEnter",
		})
		-- readline keybindings in insert mode
		use({
			"tpope/vim-rsi",
			event = "InsertEnter",
		})
		-- switch working directory
		use({
			"nyngwang/NeoRoot.lua",
			cmd = {
				"NeoRoot",
				"NeoRootChange",
				"NeoRootSwitchMode",
			},
		})
		-- ╭──────────────────────────────────────────────────────────╮
		-- │                        Git related                       │
		-- ╰──────────────────────────────────────────────────────────╯
		-- git diff viewer
		use({
			"sindrets/diffview.nvim",
			after = "neogit",
		})
		-- Magit-like git plugin
		use({
			"TimUntersberger/neogit",
			config = function()
				require("plugins-config.neogit").config()
			end,
			cmd = "Neogit",
		})
		-- Add git related info in the signs columns and popups
		use({
			"lewis6991/gitsigns.nvim",
			config = function()
				require("plugins-config.gitsigns").config()
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
			event = "BufWinEnter",
		})
		-- Automatic tags management
		-- use{ "ludovicchabant/vim-gutentags" },
		-- UI to select things (files, grep results, open buffers...)
		use({
			"nvim-telescope/telescope.nvim",
			config = function()
				require("plugins-config.telescope").config()
			end,
		})
		use({
			"nvim-telescope/telescope-fzy-native.nvim",
			requires = "nvim-telescope/telescope.nvim",
		})
		use({
			"nvim-telescope/telescope-file-browser.nvim",
			requires = "nvim-telescope/telescope.nvim",
		})
		-- file manager
		-- use{ "kyazdani42/nvim-tree.lua" },
		use({
			"elihunter173/dirbuf.nvim",
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
			config = function()
				require("plugins-config.registers").config()
			end,
		})
		-- comment eyecandies
		use({
			"LudoPinelli/comment-box.nvim",
			opt = true,
			setup = function()
				Lazyload_timer("comment-box.nvim")
			end,
		})
		-- buffer bookmarks
		use({
			"MattesGroeger/vim-bookmarks",
			config = function()
				require("plugins-config.vim-bookmarks").config()
			end,
		})
		-- undo-tree
		use({
			"simnalamburt/vim-mundo",
			opt = true,
			setup = function()
				Lazyload_timer("vim-mundo")
			end,
		})
		-- switch keywords
		use({
			"AndrewRadev/switch.vim",
			opt = true,
			setup = function()
				Lazyload_timer("switch.vim")
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
		-- ╭──────────────────────────────────────────────────────────╮
		-- │                          themes                          │
		-- ╰──────────────────────────────────────────────────────────╯
		-- Theme inspired by Atom
		use({ "joshdick/onedark.vim" })
		-- github theme
		-- use{ "projekt0n/github-nvim-theme" },
		-- catppuccin theme
		-- use({ "catppuccin/nvim", as = "catppuccin" })
		-- tokyonight theme
		use({ "folke/tokyonight.nvim" })
		-- nightfox theme
		-- use({ "EdenEast/nightfox.nvim" })
		-- Everforest theme
		use({
			"sainnhe/everforest",
			config = function()
				require("plugins-config.everforest").config()
			end,
		})
		-- gruvbox theme
		-- use({ "eddyekofo94/gruvbox-flat.nvim" })
		-- aquarium theme
		use({ "FrenzyExists/aquarium-vim" })
		-- ╭──────────────────────────────────────────────────────────╮
		-- │                     lines and widgets                    │
		-- ╰──────────────────────────────────────────────────────────╯
		-- bufferline
		-- use{ "akinsho/bufferline.nvim" },
		-- tabline
		use({
			"nanozuki/tabby.nvim",
			setup = function()
				require("plugins-config.tabby").map()
			end,
			config = function()
				require("plugins-config.tabby").config()
			end,
			event = "BufWinEnter",
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
		})
		-- Add indentation guides even on blank lines
		use({
			"lukas-reineke/indent-blankline.nvim",
			config = function()
				require("plugins-config.indent-blankline").config()
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
			run = ":TSUpdate",
		})
		-- playground
		use({
			"nvim-treesitter/playground",
			requires = { "nvim-treesitter/nvim-treesitter" },
			after = { "nvim-treesitter" },
		})
		-- Limelighting
		use({
			"folke/twilight.nvim",
			requires = { "nvim-treesitter/nvim-treesitter" },
			after = { "nvim-treesitter" },
			config = function()
				require("plugins-config.twilight").config()
			end,
		})
		-- treesitter-based context viewer
		use({
			"romgrk/nvim-treesitter-context",
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
		-- select textobject with hints
		use({
			"mfussenegger/nvim-treehopper",
			requires = { "nvim-treesitter/nvim-treesitter" },
			after = { "nvim-treesitter" },
			setup = function()
				require("plugins-config.nvim-treehopper").map()
			end,
		})
		-- refactoring support
		use({
			"ThePrimeagen/refactoring.nvim",
			requires = { "nvim-treesitter/nvim-treesitter" },
		})
		-- Generate annotation
		use({
			"danymat/neogen",
			requires = { "nvim-treesitter/nvim-treesitter" },
			config = function()
				require("plugins-config.neogen").config()
			end,
		})
		-- code biscuits, Bracket Lens-like plugin
		use({
			"code-biscuits/nvim-biscuits",
			after = { "nvim-treesitter" },
			config = function()
				require("plugins-config.biscuits").config()
			end,
		})
		use({
			"andymass/vim-matchup",
			config = function()
				require("plugins-config.matchup").config()
			end,
			-- disable = true,
		})
		-- ╭──────────────────────────────────────────────────────────╮
		-- │                            LSP                           │
		-- ╰──────────────────────────────────────────────────────────╯
		-- Collection of configurations for built-in LSP client
		use({ "neovim/nvim-lspconfig" })
		--  To Install LSP Automatically with LspInstall
		use({ "williamboman/nvim-lsp-installer" })
		-- rust lsp tools
		use({ "simrat39/rust-tools.nvim" })
		-- show signature guides on type
		use({
			"ray-x/lsp_signature.nvim",
			config = function()
				require("plugins-config.lsp_signature").config()
			end,
		})
		-- code outline
		use({ "stevearc/aerial.nvim" })
		-- Inject Format, Diagnostics, Code Actions to Lsp
		use({ "jose-elias-alvarez/null-ls.nvim" })
		use({ "PlatyPew/format-installer.nvim" })
		-- ╭──────────────────────────────────────────────────────────╮
		-- │                      Autocompletion                      │
		-- ╰──────────────────────────────────────────────────────────╯
		use({
			"hrsh7th/nvim-cmp",
			config = function()
				require("plugins-config.nvim-cmp").config()
			end,
			event = { "InsertEnter", "CmdlineEnter" },
			-- after = "friendly-snippets",
		})
		-- -- cmp devicons appearance dependency
		use({
			"onsails/lspkind-nvim",
			requires = { "hrsh7th/nvim-cmp" },
			after = "nvim-cmp",
		})
		-- -- cmp plugins
		use({
			"hrsh7th/cmp-nvim-lsp",
			requires = { "hrsh7th/nvim-cmp" },
			after = "nvim-cmp",
		})
		use({
			"saadparwaiz1/cmp_luasnip",
			requires = { "hrsh7th/nvim-cmp" },
			after = "nvim-cmp",
		})
		use({
			"hrsh7th/cmp-path",
			requires = { "hrsh7th/nvim-cmp" },
			after = "nvim-cmp",
		})
		use({
			"hrsh7th/cmp-nvim-lsp-document-symbol",
			requires = { "hrsh7th/nvim-cmp" },
			after = "nvim-cmp",
		})
		use({
			"hrsh7th/cmp-buffer",
			requires = { "hrsh7th/nvim-cmp" },
			after = "nvim-cmp",
		})
		use({
			"hrsh7th/cmp-cmdline",
			requires = { "hrsh7th/nvim-cmp" },
			after = "nvim-cmp",
		})
		use({
			"octaltree/cmp-look",
			requires = { "hrsh7th/nvim-cmp" },
			after = "nvim-cmp",
		})
		use({
			"ray-x/cmp-treesitter",
			requires = { "hrsh7th/nvim-cmp" },
			after = "nvim-cmp",
		})
		use({
			"lukas-reineke/cmp-rg",
			requires = { "hrsh7th/nvim-cmp" },
			after = "nvim-cmp",
		})
		use({
			"lukas-reineke/cmp-under-comparator",
			requires = { "hrsh7th/nvim-cmp" },
			after = "nvim-cmp",
		})
		-- use{ "tzachar/cmp-tabnine", run = "./install.sh" },
		-- github copilot
		use({
			"github/copilot.vim",
			config = function()
				require("plugins-config.copilot").config()
			end,
		})
		use({
			"hrsh7th/cmp-copilot",
			requires = { "hrsh7th/nvim-cmp", "github/copilot.vim" },
			after = "nvim-cmp",
		})
		-- Snippets plugin
		use({
			"L3MON4D3/LuaSnip",
			requires = { "hrsh7th/nvim-cmp" },
			after = "nvim-cmp",
		})
		-- snippets bundle
		use({
			"rafamadriz/friendly-snippets",
			requires = { "hrsh7th/nvim-cmp", "L3MON4D3/LuaSnip" },
			event = "InsertEnter",
			-- after = "nvim-cmp",
		})
		-- ╭──────────────────────────────────────────────────────────╮
		-- │                          debug                           │
		-- ╰──────────────────────────────────────────────────────────╯
		-- Debug Adapter Protocol
		use({
			"mfussenegger/nvim-dap",
			setup = function()
				require("plugins-config.dap").map()
			end,
			config = function()
				require("plugins-config.dap").config()
			end,
		})
		-- DAP UI
		use({ "rcarriga/nvim-dap-ui" })
		-- vitrual text
		use({ "theHamsta/nvim-dap-virtual-text" })
		-- DAP Installer
		use({ "Pocco81/DAPInstall.nvim" })
		-- async task runners
		use({
			"skywind3000/asyncrun.vim",
		})
		use({
			"skywind3000/asynctasks.vim",
			requires = { "skywind3000/asyncrun.vim" },
			after = "asyncrun.vim",
		})
		-- ╭──────────────────────────────────────────────────────────╮
		-- │                           Misc                           │
		-- ╰──────────────────────────────────────────────────────────╯
		-- spellcheck
		use({
			"kamykn/spelunker.vim",
			config = function()
				require("plugins-config.spelunker").config()
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
		})
		-- Faster f/f
		use({ "ggandor/lightspeed.nvim" })
		-- fuzzy match easymotion
		-- use({ "rlane/pounce.nvim" })
		-- hop easymotion
		use({
			"phaazon/hop.nvim",
			branch = "v1",
			setup = function()
				require("plugins-config.hop").map()
			end,
			config = function()
				require("plugins-config.hop").config()
			end,
			cmd = {
				"HopWord",
				"HopWordBC",
				"HopWordAC",
				"HopWordCurrentLine",
				"HopWordCurrentLineBC",
				"HopWordCurrentLineAC",
			},
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
		})
		-- substitute operator
		use({
			"gbprod/substitute.nvim",
			config = function()
				require("plugins-config.substitute").config()
			end,
		})
		-- commenting
		use({
			"b3nj5m1n/kommentary",
			setup = function()
				require("plugins-config.kommentary").map()
			end,
			config = function()
				require("plugins-config.kommentary").config()
			end,
		})
		-- multi cursor
		use({
			"mg979/vim-visual-multi",
			event = "BufWinEnter",
		})
		-- Colorize brackets
		use({ "p00f/nvim-ts-rainbow" })
		-- color highlighter
		use({
			"norcalli/nvim-colorizer.lua",
			config = function()
				require("plugins-config.colorizer").config()
			end,
		})
		-- outline viewer
		-- use{ "simrat39/symbols-outline.nvim" },
		-- Discover available code action like VSCode
		use({
			"kosayoda/nvim-lightbulb",
			config = function()
				require("plugins-config.lightbulb").config()
			end,
		})
		-- code action modal
		use({ "weilbith/nvim-code-action-menu" })
		-- Show matched information in search
		use({
			"kevinhwang91/nvim-hlslens",
			config = function()
				require("plugins-config.hlslens").config()
			end,
		})
		-- Show keybindings
		use({
			"folke/which-key.nvim",
			config = function()
				require("plugins-config.which-key").config()
			end,
		})
		-- Problem view
		use({
			"folke/trouble.nvim",
			config = function()
				require("plugins-config.trouble").config()
			end,
		})
		use({
			"folke/todo-comments.nvim",
			setup = function()
				require("plugins-config.todo-comments").map()
			end,
			config = function()
				require("plugins-config.todo-comments").config()
			end,
		})
		-- highlighting the word under cursor
		use({
			"RRethy/vim-illuminate",
			config = function()
				require("plugins-config.vim-illuminate").config()
			end,
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
		-- project file anchor
		use({
			"ThePrimeagen/harpoon",
			config = function()
				require("plugins-config.harpoon").config()
			end,
		})
		-- Better quickfix
		use({ "kevinhwang91/nvim-bqf" })
		use({
			"stevearc/qf_helper.nvim",
			config = function()
				require("plugins-config.qf_helper").config()
			end,
		})
		-- Batch editing quickfix
		use({ "gabrielpoca/replacer.nvim" })
		-- terminal integration
		use({
			"akinsho/toggleterm.nvim",
			config = function()
				require("plugins-config.toggleterm").config()
			end,
			event = "BufWinEnter",
		})
		-- project management
		use({ "ahmedkhalf/project.nvim" })
		-- automatic split management
		use({
			"beauwilliams/focus.nvim",
			config = function()
				require("plugins-config.focus").config()
			end,
		})
		-- Zen mode
		use({
			"folke/zen-mode.nvim",
			config = function()
				require("plugins-config.zen-mode").config()
			end,
			cmd = "ZenMode",
		})
		-- narrow region buffer
		use({ "chrisbra/NrrwRgn" })
		-- show inline git blame
		use({
			"APZelos/blamer.nvim",
			config = function()
				require("plugins-config.blamer").config()
			end,
			event = "BufRead",
		})
		-- json viewer
		use({ "gennaro-tedesco/nvim-jqx" })
		-- cpbooster, competitive programming cli tool
		use({ "searleser97/cpbooster.vim" })
		if packer_bootstrap then
			require("packer").sync()
		end
	end,
	config = {
		display = {
			open_fn = require("packer.util").float, -- floating window
			compile_path = vim.fn.stdpath("config") .. "/lua/packer_compiled.lua", -- to optimize loading with impatient
		},
	},
})

-- ╭──────────────────────────────────────────────────────────╮
-- │                      plugin config                       │
-- ╰──────────────────────────────────────────────────────────╯

-- mapping sugar syntax
require("mapx").setup({ global = true }) -- global keymap helper

-- require plugin's config helper
local p = function(name)
	return string.format("plugins-config.%s", name)
end

--- themes
local function load_theme()
	-- require(p("catppuccin")).config()
	-- require(p("everforest")).config()
end
load_theme()

-- load plugin configs
local function load_configs()
	-- require(p("nvim-cmp")).config() -- completion related bundle
	-- require(p("autopairs")).config()
	-- require(p("autosave")).config()
	-- require(p("better-escape")).config()
	-- require(p("biscuits")).config()
	-- require(p("tabby")).config()
	-- require(p("vim-ctrlspace")).config()
	-- require(p("copilot")).config()
	-- require(p("colorizer")).config()
	-- require(p("dressing")).config()
	-- require(p("focus")).config()
	-- require(p("gesture")).config()
	-- require(p("gitsigns")).config()
	-- require(p("kommentary")).config()
	-- require(p("harpoon")).config()
	-- require(p("indent-blankline")).config()
	-- require(p("lightbulb")).config()
	-- require(p("lsp_signature")).config()
	-- require(p("lualine")).config()
	-- require(p("neogit")).config()
	-- require(p("notify")).config()
	-- require(p("nvim-tree")).config()
	-- require(p("nvim-treesitter")).config()
	-- require(p("pretty-fold")).config()
	-- require(p("qf_helper")).config()
	-- require(p("registers")).config()
	-- require(p("sandwich")).config()
	-- require(p("spectre")).config()
	-- require(p("substitute")).config()
	-- require(p("symbols-outline")).config()
	-- require(p("tabout")).config()
	-- require(p("telescope")).config()
	-- require(p("todo-comments")).config()
	-- require(p("toggleterm")).config()
	-- require(p("treesitter-unit")).config()
	-- require(p("trouble")).config()
	-- require(p("vim-bookmarks")).config()
	-- require(p("which-key")).config()
	-- require(p("auto-session")).config()
	-- require(p("neovim-session-manager")).config()
	-- require(p("hlslens")).config()
	-- require(p("scrollbar")).config()
	-- require(p("treesitter-context")).config()
	-- require(p("nvim-gps")).config()
	-- require(p("twilight")).config()
	-- require(p("vim-illuminate")).config()
	-- require(p("spelunker")).config()
	-- require(p("numb")).config()
	-- require(p("neogen")).config()
	-- require(p("zen-mode")).config()
	-- require(p("blamer")).config()
	-- require(p("dirbuf")).config()
	-- require(p("octo")).config()
	-- require(p("hop")).config()
	-- require(p("dap")).config() -- dap-related bundle
end
-- load_configs()
