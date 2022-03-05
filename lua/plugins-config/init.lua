-- initialize util function aliases
local fn = vim.fn
-- ╭──────────────────────────────────────────────────────────╮
-- │                      plugins loading                     │
-- ╰──────────────────────────────────────────────────────────╯
vim.g["jetpack#optimization"] = 2
vim.cmd("packadd vim-jetpack")
require("jetpack").startup(function(use)
	use({
		"tani/vim-jetpack",
		-- opt = 1,
	})
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
	-- fix cursorhold performance problem
	use({ "antoinemadec/FixCursorHold.nvim" })
	-- UI overhaul
	use({ "stevearc/dressing.nvim" })
	-- sudo
	use({
		"lambdalisue/suda.vim",
		-- -- opt = 1,
		on = { "SudaWrite", "SudaRead" },
	})
	-- Session manager
	use({ "Shatur/neovim-session-manager" })
	-- Close buffer/window/vim wisely
	use({
		"mhinz/vim-sayonara",
		-- opt = true,
		on = { "Sayonara" },
	})
	-- automatic indent detection
	use({ "tpope/vim-sleuth" })
	-- Better Escape
	use({
		"max397574/better-escape.nvim",
		-- opt = 1,
		-- on = "InsertEnter",
	})
	-- Better line number jump with peek
	use({
		"nacro90/numb.nvim",
		-- opt = true,
		-- on = "CmdlineEnter",
	})
	-- mouse gestures
	use({
		"notomo/gesture.nvim",
		-- opt = true,
	})
	-- readline keybindings in insert mode
	use({
		"tpope/vim-rsi",
		-- opt = 1,
		-- on = "InsertEnter",
	})
	-- switch working directory
	use({
		"nyngwang/NeoRoot.lua",
		-- opt = 1,
		on = {
			"NeoRoot",
			"NeoRootChange",
			"NeoRootSwitchMode",
		},
	})
	-- redirect command output to dedicated buffer
	use({ "sbulav/nredir.nvim" })
	-- ╭──────────────────────────────────────────────────────────╮
	-- │                        Git related                       │
	-- ╰──────────────────────────────────────────────────────────╯
	-- git diff viewer
	use({
		"sindrets/diffview.nvim",
		-- opt = true,
		on = "Neogit",
	})
	-- Magit-like git plugin
	use({
		"TimUntersberger/neogit",
		-- opt = true,
		-- on = "Neogit",
	})
	-- Add git related info in the signs columns and popups
	use({
		"lewis6991/gitsigns.nvim",
		-- opt = 1,
	})
	-- Github editor
	use({
		"pwntester/octo.nvim",
		-- on = "CmdlineEnter",
	})
	-- ╭──────────────────────────────────────────────────────────╮
	-- │                           files                          │
	-- ╰──────────────────────────────────────────────────────────╯
	-- search buffer
	use({
		"nvim-pack/nvim-spectre",
		-- opt = 1,
		-- on = "BufWinEnter",
	})
	-- Automatic tags management
	-- use{ "ludovicchabant/vim-gutentags" },
	-- UI to select things (files, grep results, open buffers...)
	use({ "nvim-telescope/telescope.nvim" })
	use({
		"nvim-telescope/telescope-file-browser.nvim", -- requires = "nvim-telescope/telescope.nvim",
	})
	use({ "tami5/sqlite.lua" })
	use({
		"nvim-telescope/telescope-frecency.nvim", -- requires = { "nvim-telescope/telescope.nvim", "tami5/sqlite.lua" },
	})
	use({
		"willthbill/opener.nvim", -- requires = "nvim-telescope/telescope.nvim",
	})
	-- file manager
	-- use{ "kyazdani42/nvim-tree.lua" },
	use({
		"elihunter173/dirbuf.nvim",
		-- opt = 1,
		on = "Dirbuf",
	})
	-- ╭──────────────────────────────────────────────────────────╮
	-- │                       text editing                       │
	-- ╰──────────────────────────────────────────────────────────╯
	-- yank kill-ring
	use({ "tversteeg/registers.nvim" })
	-- comment eyecandies
	use({
		"LudoPinelli/comment-box.nvim",
		-- opt = true,
	})
	-- buffer bookmarks
	use({
		"MattesGroeger/vim-bookmarks",
	})
	-- undo-tree
	use({
		"simnalamburt/vim-mundo",
		-- opt = true,
	})
	-- switch keywords
	use({
		"AndrewRadev/switch.vim",
		-- opt = true,
	})
	use({
		"Matt-A-Bennett/vim-surround-funk",
		-- opt = true,
	})
	-- find a unique character in each word
	use({
		"unblevable/quick-scope",
		-- opt = true,
	})
	-- split/join lines
	use({
		"AndrewRadev/splitjoin.vim",
		-- opt = true,
	})
	-- non-lsp formatter
	use({ "sbdchd/neoformat" })
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
			-- require("plugins-config.everforest").config()
		end,
		-- on = "BufRead",
	})
	-- gruvbox theme
	-- use({ "eddyekofo94/gruvbox-flat.nvim" })
	-- aquarium theme
	-- use({
	-- 	"FrenzyExists/aquarium-vim",
	-- 	config = function()
	-- 		-- require("plugins-config.aquarium").config()
	-- 	end,
	-- })

	use({ "rktjmp/lush.nvim" })
	use({
		"mcchrish/zenbones.nvim",
		requires = "rktjmp/lush.nvim",
		config = function()
			-- require("plugins-config.zenbones").config()
		end,
	})
	use({
		"annenpolka/no-clown-fiesta.nvim",
	})
	-- ╭──────────────────────────────────────────────────────────╮
	-- │                     lines and widgets                    │
	-- ╰──────────────────────────────────────────────────────────╯
	-- bufferline
	-- use{ "akinsho/bufferline.nvim" },
	-- tabline
	use({
		"nanozuki/tabby.nvim",
		-- on = "BufWinEnter",
	})
	-- Fancier statusline
	use({
		"nvim-lualine/lualine.nvim",
		-- opt = 1,
		-- on = "BufRead",
	})
	-- scrollbar with search info
	use({
		"petertriho/nvim-scrollbar",
		-- opt = 1,
	})
	-- Add indentation guides even on blank lines
	use({
		"lukas-reineke/indent-blankline.nvim",
		-- opt = 1,
		-- on = "BufRead",
	})
	use({ "echasnovski/mini.nvim" })
	-- ╭──────────────────────────────────────────────────────────╮
	-- │                        treesitter                        │
	-- ╰──────────────────────────────────────────────────────────╯
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		-- opt = 1,
	})
	-- playground
	use({ "nvim-treesitter/playground" })
	-- Limelighting
	use({ "folke/twilight.nvim" })
	-- treesitter-based context viewer
	use({ "romgrk/nvim-treesitter-context" })
	-- breadcrumb
	use({ "SmiteshP/nvim-gps" })
	-- Additional textobjects for treesitter
	use({ "nvim-treesitter/nvim-treesitter-textobjects" })
	-- html autotag
	use({ "windwp/nvim-ts-autotag" })
	-- textobject unit helper
	use({ "David-Kunz/treesitter-unit" })
	-- select textobject with hints
	use({ "mfussenegger/nvim-treehopper" })
	-- refactoring support
	use({ "ThePrimeagen/refactoring.nvim" })
	-- Generate annotation
	use({ "danymat/neogen" })
	-- Bracket Lens-like plugin
	use({ "haringsrob/nvim_context_vt" })
	use({ "andymass/vim-matchup" })
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
		-- opt = 1,
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
		-- opt = 1,
	})
	-- -- cmp devicons appearance dependency
	use({
		"onsails/lspkind-nvim", -- after = "nvim-cmp",
	})
	-- -- cmp plugins
	use({
		"hrsh7th/cmp-nvim-lsp", -- after = "nvim-cmp",
	})
	use({
		"saadparwaiz1/cmp_luasnip", -- after = "nvim-cmp",
	})
	use({
		"hrsh7th/cmp-path", -- after = "nvim-cmp",
	})
	use({
		"hrsh7th/cmp-nvim-lsp-document-symbol", -- after = "nvim-cmp",
	})
	use({
		"hrsh7th/cmp-buffer", -- after = "nvim-cmp",
	})
	use({
		"hrsh7th/cmp-cmdline", -- after = "nvim-cmp",
	})
	use({
		"octaltree/cmp-look", -- after = "nvim-cmp",
	})
	use({
		"ray-x/cmp-treesitter", -- after = "nvim-cmp",
	})
	use({
		"lukas-reineke/cmp-rg", -- after = "nvim-cmp",
	})
	use({
		"lukas-reineke/cmp-under-comparator", -- after = "nvim-cmp",
	})
	-- use{ "tzachar/cmp-tabnine", run = "./install.sh" },
	-- github copilot
	use({
		"github/copilot.vim",
		-- opt = 1,
	})
	use({
		"hrsh7th/cmp-copilot", -- after = "nvim-cmp",
	})
	-- Snippets plugin
	use({
		"L3MON4D3/LuaSnip", -- after = "nvim-cmp",
	})
	-- snippets bundle
	use({
		"rafamadriz/friendly-snippets",
		-- on = "InsertEnter",
		-- after = "nvim-cmp",
	})
	-- ╭──────────────────────────────────────────────────────────╮
	-- │                          debug                           │
	-- ╰──────────────────────────────────────────────────────────╯
	-- Debug Adapter Protocol
	use({
		"mfussenegger/nvim-dap",
		-- opt = 1,
	})
	-- DAP UI
	use({
		"rcarriga/nvim-dap-ui", -- after = "nvim-dap",
		-- opt = 1,
	})
	-- vitrual text
	use({
		"theHamsta/nvim-dap-virtual-text", -- after = "nvim-dap",
		-- opt = 1,
	})
	-- DAP Installer
	use({
		"Pocco81/DAPInstall.nvim", -- after = "nvim-dap",
		-- opt = 1,
	})
	-- async task runners
	use({ "skywind3000/asyncrun.vim" })
	use({
		"skywind3000/asynctasks.vim", -- after = "asyncrun.vim",
	})
	-- ╭──────────────────────────────────────────────────────────╮
	-- │                           Misc                           │
	-- ╰──────────────────────────────────────────────────────────╯
	-- spellcheck
	use({
		"kamykn/spelunker.vim",
		-- opt = 1,
	})
	-- tabout
	use({
		"abecodes/tabout.nvim",
		-- on = "InsertEnter",
	})
	-- Notification balloon
	use({ "rcarriga/nvim-notify" })
	-- folding
	use({ "anuvyklack/pretty-fold.nvim" })
	-- Faster f/f
	use({
		"ggandor/lightspeed.nvim", -- opt = false,
	})
	-- fuzzy match easymotion
	-- use({ "rlane/pounce.nvim" })
	-- hop easymotion
	use({
		"phaazon/hop.nvim",
		branch = "master",
		-- opt = 1,
		on = {
			"HopWord",
			"HopWordBC",
			"HopWordAC",
			"HopWordCurrentLine",
			"HopWordCurrentLineBC",
			"HopWordCurrentLineAC",
			"HopLine",
			"HopLineAC",
			"HopLineBC",
			"HopChar1",
			"HopChar1AC",
			"HopChar1BC",
			"HopChar2",
			"HopChar2AC",
			"HopChar2BC",
			"HopPattern",
			"HopPatternAC",
			"HopPatternBC",
		},
	})
	-- surrounding plugin
	use({ "machakann/vim-sandwich" })
	-- substitute operator
	use({ "gbprod/substitute.nvim" })
	-- commenting
	use({
		"b3nj5m1n/kommentary", -- opt = true,
	})
	-- multi cursor
	use({
		"mg979/vim-visual-multi", -- opt = true,
	})
	-- Colorize brackets
	use({ "p00f/nvim-ts-rainbow" })
	-- color highlighter
	use({ "norcalli/nvim-colorizer.lua" })
	-- outline viewer
	-- use{ "simrat39/symbols-outline.nvim" },
	-- Discover available code action like VSCode
	use({ "kosayoda/nvim-lightbulb" })
	-- code action modal
	use({ "weilbith/nvim-code-action-menu" })
	-- Show matched information in search
	use({ "kevinhwang91/nvim-hlslens" })
	-- Show keybindings
	use({
		"folke/which-key.nvim",
		-- opt = 1,
	})
	-- Problem view
	use({
		"folke/trouble.nvim", -- opt = true,
	})
	use({ "folke/todo-comments.nvim" })
	-- highlighting the word under cursor
	use({
		"RRethy/vim-illuminate",
		-- opt = 1,
	})
	-- Autopair
	use({
		"windwp/nvim-autopairs", -- opt = true,
	})
	-- project file anchor
	use({
		"ThePrimeagen/harpoon", -- opt = true,
	})
	-- Better quickfix
	use({ "kevinhwang91/nvim-bqf" })
	use({ "stevearc/qf_helper.nvim" })
	-- Batch editing quickfix
	use({ "gabrielpoca/replacer.nvim" })
	-- terminal integration
	use({
		"akinsho/toggleterm.nvim",
		-- on = "BufWinEnter",
	})
	-- project management
	use({ "ahmedkhalf/project.nvim" })
	-- automatic split management
	use({
		"beauwilliams/focus.nvim",
		-- opt = 1,
		-- on = { "FocusSplitDown", "FocusSplitUp", "FocusSplitLeft", "FocusSplitRight" },
	})
	-- Zen mode
	use({
		"folke/zen-mode.nvim",
		-- on = "ZenMode",
	})
	-- region buffer window
	use({
		"hoschi/yode-nvim",
	})
	-- show inline git blame
	use({
		"APZelos/blamer.nvim",
		-- on = "BufRead",
	})
	-- json viewer
	use({
		"gennaro-tedesco/nvim-jqx",
		ft = "json",
	})
	-- cpbooster, competitive programming cli tool
	use({
		"searleser97/cpbooster.vim", -- opt = true,
	})
end)

-- ╭──────────────────────────────────────────────────────────╮
-- │                      plugin config                       │
-- ╰──────────────────────────────────────────────────────────╯

-- optimize lua loading
require("impatient").enable_profile()
-- mapping sugar syntax
require("mapx").setup({
	global = true,
})

-- lazyload a plugin and its config on event
-- set config name if there is a config file
local function load_on_event(event, name, config)
	local command = [[autocmd ]] .. event .. [[ * packadd ]] .. name
	if config and io.open(vim.fn.stdpath("config") .. "/lua/plugins-config/" .. config .. ".lua", "r") then
		command = command .. [[ | lua require("plugins-config.]] .. config .. [[").config()]]
	else -- no config
		-- set config value as module name
		config = config or name
		-- using pcall to avoid the error with vimscript plugins
		command = command .. [[ | lua pcall(require, "]] .. config .. [[")]]
	end
	vim.cmd(command)
end

-- load config on jetpack autocmd
-- name for vimscript is plugin's name, name for lua is its module name
local function load_config_on_jetpack(name, config)
	local event = vim.fn.substitute(name, [[\W\+]], [[_]], "g")
	event = vim.fn.substitute(event, [[\(^\|_\)\(.\)]], [[\u\2]], "g")
	vim.cmd([[autocmd! User Jetpack]] .. event .. [[ lua require("plugins-config.]] .. config .. [[").config()]])
end

local function packadd_on_jetpack(name, plugin, module)
	local event = vim.fn.substitute(name, [[\W\+]], [[_]], "g")
	event = vim.fn.substitute(event, [[\(^\|_\)\(.\)]], [[\u\2]], "g")
	vim.cmd(
		[[autocmd! User Jetpack]] .. event .. [[ packadd ]] .. plugin -- .. [[ | lua pcall(require,"]] .. module .. [[")]]
	)
	-- print(module .. " loaded")
end

-- packadd timer
local function packadd_timer(plugin, module, timer)
	if plugin then
		timer = timer or 100
		vim.defer_fn(function()
			vim.cmd("packadd " .. plugin)
		end, timer)
		local ok, _ = pcall(require, module)
	end
end

-- lazyload by timer
local function lazyload_timer(plugin, module, config, timer)
	load_config_on_jetpack(module, config)
	packadd_timer(plugin, module, timer)
end

-- config loading autocmd
local function load_config()
	-- theme
	vim.cmd("colorscheme everforest")

	-- load on start
	require("plugins-config.mini-starter").config()
	require("plugins-config.mini-indentscope").config()
	require("plugins-config.vim-bookmarks").config()
	require("plugins-config.telescope").config()
	require("plugins-config.tabby").config()
	require("plugins-config.registers").config()
	require("plugins-config.matchup").config()
	require("plugins-config.kommentary").config()

	-- config list
	vim.o.termguicolors = true
	require("plugins-config.nvim-treesitter").config()
	require("plugins-config.nvim-cmp").config()
	require("plugins-config.aerial").config()
	require("plugins-config.autopairs").config()
	require("plugins-config.better-escape").config()
	require("plugins-config.blamer").config()
	require("plugins-config.colorizer").config()
	require("plugins-config.context_vt").config()
	require("plugins-config.copilot").config()
	require("plugins-config.dap").config()
	require("plugins-config.dirbuf").config()
	require("plugins-config.dressing").config()
	require("plugins-config.everforest").config()
	require("plugins-config.focus").config()
	require("plugins-config.gesture").config()
	require("plugins-config.gitsigns").config()
	require("plugins-config.harpoon").config()
	require("plugins-config.hlslens").config()
	require("plugins-config.hop").config()
	require("plugins-config.indent-blankline").config()
	require("plugins-config.kommentary").config()
	require("plugins-config.lightbulb").config()
	require("plugins-config.lsp_signature").config()
	require("plugins-config.matchup").config()
	require("plugins-config.mini-indentscope").config()
	require("plugins-config.mini-starter").config()
	require("plugins-config.neogen").config()
	require("plugins-config.neogit").config()
	require("plugins-config.neovim-session-manager").config()
	require("plugins-config.notify").config()
	require("plugins-config.numb").config()
	require("plugins-config.nvim-gps").config()
	require("plugins-config.nvim-treehopper").config()
	require("plugins-config.octo").config()
	require("plugins-config.pounce").config()
	require("plugins-config.pretty-fold").config()
	require("plugins-config.qf_helper").config()
	require("plugins-config.registers").config()
	require("plugins-config.sandwich").config()
	require("plugins-config.scrollbar").config()
	require("plugins-config.spectre").config()
	require("plugins-config.spelunker").config()
	require("plugins-config.substitute").config()
	require("plugins-config.symbols-outline").config()
	require("plugins-config.tabby").config()
	require("plugins-config.tabout").config()
	require("plugins-config.telescope").config()
	require("plugins-config.todo-comments").config()
	require("plugins-config.toggleterm").config()
	require("plugins-config.treesitter-context").config()
	require("plugins-config.treesitter-unit").config()
	require("plugins-config.trouble").config()
	require("plugins-config.twilight").config()
	require("plugins-config.vim-bookmarks").config()
	require("plugins-config.vim-ctrlspace").config()
	require("plugins-config.vim-illuminate").config()
	require("plugins-config.which-key").config()
	require("plugins-config.yode").config()
	require("plugins-config.zen-mode").config()
	-- require("plugins-config.zenbones").config()

	-- load config on require(lua), packadd(vimscript)
	load_config_on_jetpack("dressing", "dressing")
	load_config_on_jetpack("session-manager", "neovim-session-manager")
	load_config_on_jetpack("gesture", "gesture")
	load_config_on_jetpack("neogit", "neogit")
	load_config_on_jetpack("hop", "hop")
	load_config_on_jetpack("dirbuf", "dirbuf")

	-- lazyload
	-- -- timer
	lazyload_timer("nvim-spectre", "spectre", "spectre", 1000)
	lazyload_timer("lualine.nvim", "lualine", "lualine", 100)
	-- -- event
	load_on_event("FileType", "gitsigns.nvim", "gitsigns")
	load_on_event("FileType,BufRead,BufNewFile", "substitute.nvim", "substitute")
	load_on_event("FileType,BufRead,BufNewFile", "nvim-scrollbar", "scrollbar")
	load_on_event("FileType,BufRead,BufNewFile", "which-key.nvim", "which-key")
	load_on_event("FileType,BufRead,BufNewFile", "yode-nvim", "yode")
	load_on_event("FileType,BufRead,BufNewFile", "copilot.vim", "copilot")
	load_on_event("FileType,BufRead,BufNewFile", "focus.nvim", "focus")
	load_on_event("FileType,BufRead,BufNewFile", "indent-blankline.nvim", "indent-blankline")
	load_on_event("FileType,BufRead,BufNewFile", "vim-illuminate", "vim-illuminate")
	load_on_event("CmdlineEnter", "numb", "numb")
	load_on_event("CmdlineEnter", "octo.nvim", "octo")
	load_on_event("InsertEnter", "better-escape.nvim", "better-escape")
	load_on_event("InsertEnter", "lsp_signature.nvim", "lsp_signature")
	load_on_event("InsertEnter", "vim-rsi")

	-- TODO: create vim-surround-funk config with mappings
	vim.g.surround_funk_create_mappings = 0
	-- --  treesitter things
	load_on_event("BufRead", "nvim-treesitter", "nvim-treesitter")
	vim.cmd([[
    augroup TreesitterRelated
     autocmd!
     autocmd User JetpackNvimTreesitter lua require("plugins-config.twilight").config() 
     autocmd User JetpackNvimTreesitter lua require("plugins-config.treesitter-context").config()
     autocmd User JetpackNvimTreesitter lua require("plugins-config.nvim-gps").config()
     autocmd User JetpackNvimTreesitter lua require("plugins-config.treesitter-unit").config()
     autocmd User JetpackNvimTreesitter lua require("plugins-config.nvim-treehopper").config()
     autocmd User JetpackNvimTreesitter lua require("plugins-config.neogen").config()
     autocmd User JetpackNvimTreesitter lua require("plugins-config.context_vt").config()
     autocmd User JetpackNvimTreesitter lua require("plugins-config.aerial").config()
    augroup END
  ]])

	-- nvim-cmp things
	load_on_event("InsertEnter,CmdlineEnter", "nvim-cmp", "nvim-cmp")
	packadd_on_jetpack("nvim-cmp", "lspkind-nvim")
	packadd_on_jetpack("nvim-cmp", "cmp-nvim-lsp")
	packadd_on_jetpack("nvim-cmp", "cmp_luasnip")
	packadd_on_jetpack("nvim-cmp", "cmp-path")
	packadd_on_jetpack("nvim-cmp", "cmp-nvim-lsp-document-symbol")
	packadd_on_jetpack("nvim-cmp", "cmp-buffer")
	packadd_on_jetpack("nvim-cmp", "cmp-cmdline")
	packadd_on_jetpack("nvim-cmp", "cmp-look")
	packadd_on_jetpack("nvim-cmp", "cmp-treesitter")
	packadd_on_jetpack("nvim-cmp", "cmp-rg")
	packadd_on_jetpack("nvim-cmp", "cmp-under-comparator")
	packadd_on_jetpack("nvim-cmp", "cmp-copilot")
	packadd_on_jetpack("nvim-cmp", "friendly-snippets")
	packadd_on_jetpack("nvim-cmp", "LuaSnip")

	-- TODO: lazyload nvim-cmp related plugins

	-- nvim-dap things
	load_on_event("BufWinEnter", "nvim-dap")
	load_on_event("BufWinEnter", "nvim-dap-ui")
	load_on_event("BufWinEnter", "nvim-dap-virtual-text")
	load_on_event("BufWinEnter", "DAPInstall.nvim", "dap-install")
	vim.cmd([[
	   augroup DapConfig
	    autocmd!
	    autocmd User JetpackDapInstall lua require("plugins-config.dap").config()
	   augroup END
	 ]])

	-- list
	load_on_event("BufRead", "spelunker.vim", "spelunker")
	require("plugins-config.spelunker").config()
	require("plugins-config.tabout").config()
	require("plugins-config.notify").config()
	require("plugins-config.pretty-fold").config()
	require("plugins-config.sandwich").config()
	require("plugins-config.kommentary").config()
	require("plugins-config.colorizer").config()
	require("plugins-config.lightbulb").config()
	require("plugins-config.hlslens").config()
	require("plugins-config.trouble").config()
	require("plugins-config.todo-comments").config()
	require("plugins-config.autopairs").config()
	require("plugins-config.harpoon").config()
	require("plugins-config.qf_helper").config()
	require("plugins-config.toggleterm").config()
	require("plugins-config.zen-mode").config()
	require("plugins-config.blamer").config()
end
load_config()
