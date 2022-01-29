-- optimize loading
require("impatient").enable_profile()

-- ╭──────────────────────────────────────────────────────────╮
-- │                      plugins loading                     │
-- ╰──────────────────────────────────────────────────────────╯
local function load_plugins()
	require("paq")({
		{ "savq/paq-nvim" },
		-- lua loading optimizer
		{ "lewis6991/impatient.nvim" },
-- ╭──────────────────────────────────────────────────────────╮
-- │                    runtime, dependency                   │
-- ╰──────────────────────────────────────────────────────────╯
		{ "kyazdani42/nvim-web-devicons" },
		{ "nvim-lua/plenary.nvim" },
		{ "MunifTanjim/nui.nvim" },
		{ "kamykn/popup-menu.nvim" },
		-- { "vim-denops/denops.vim" },
		-- fzf
		{
			"junegunn/fzf",
			run = function()
				vim.fn["fzf#install"]()
			end,
		},
		-- mapping helper functions
		{ "b0o/mapx.nvim" },
		---------------------------------------------------------------------------------
		-- UI overhaul
		{ "stevearc/dressing.nvim" },
		-- Session manager
		-- { "rmagatti/auto-session" },
		{ "Shatur/neovim-session-manager" },
		-- Close buffer/window/vim wisely
		{ "mhinz/vim-sayonara" },
		-- automatic indent detection
		{ "tpope/vim-sleuth" },
		-- Better Escape
		{ "max397574/better-escape.nvim" },
		-- Better line number jump with peek
		{ "nacro90/numb.nvim" },
		-- autosave
		{ "Pocco81/AutoSave.nvim" },
		-- mouse gestures
		{ "notomo/gesture.nvim" },
		-- Git related
		{ "sindrets/diffview.nvim" }, -- git diff viewer
		-- Magit-like git plugin
		{ "TimUntersberger/neogit" },
		-- Add git related info in the signs columns and popups
		{ "lewis6991/gitsigns.nvim" },
		-- search buffer
		{ "nvim-pack/nvim-spectre" },
		-- Automatic tags management
		-- { "ludovicchabant/vim-gutentags" },
		-- UI to select things (files, grep results, open buffers...)
		{ "nvim-telescope/telescope.nvim" },
		{ "nvim-telescope/telescope-fzy-native.nvim" },
		{ "nvim-telescope/telescope-file-browser.nvim" },
		-- file manager
		-- { "kyazdani42/nvim-tree.lua" },
		-- Theme inspired by Atom
		{ "joshdick/onedark.vim" },
		-- github theme
		-- { "projekt0n/github-nvim-theme" },
		-- catppuccin theme
		{ "catppuccin/nvim", as = "catppuccin" },
		-- tokyonight theme
		{ "folke/tokyonight.nvim" },
		-- Project root switcher
		-- { "nyngwang/NeoRoot.lua" },
		-- buffer selector
		-- { "vim-ctrlspace/vim-ctrlspace" },
		-- bufferline
		-- { "akinsho/bufferline.nvim" },
		-- tabline
		{ "nanozuki/tabby.nvim" },
		-- Fancier statusline
		{ "nvim-lualine/lualine.nvim" },
		{ "windwp/windline.nvim" },
		-- scrollbar with search info
		{ "petertriho/nvim-scrollbar" },
		-- Add indentation guides even on blank lines
		{ "lukas-reineke/indent-blankline.nvim" },
		-- ╭──────────────────────────────────────────────────────────╮
		-- │                        treesitter                        │
		-- ╰──────────────────────────────────────────────────────────╯
		{ "nvim-treesitter/nvim-treesitter" },
		-- Limelighting
		{ "folke/twilight.nvim" },
		-- treesitter-based context viewer
		{ "romgrk/nvim-treesitter-context" },
		-- breadcrumb
		{ "SmiteshP/nvim-gps" },
		-- Additional textobjects for treesitter
		{ "nvim-treesitter/nvim-treesitter-textobjects" },
		-- html autotag
		{ "windwp/nvim-ts-autotag" },
		-- textobject unit helper
		{ "David-Kunz/treesitter-unit" },
		-- refactoring support
		{ "ThePrimeagen/refactoring.nvim" },
		-- Generate annotation
		{ "danymat/neogen" },
		-- ╭──────────────────────────────────────────────────────────╮
		-- │                            LSP                           │
		-- ╰──────────────────────────────────────────────────────────╯
		-- Collection of configurations for built-in LSP client
		{ "neovim/nvim-lspconfig" },
		--  To Install LSP Automatically with LspInstall
		{ "williamboman/nvim-lsp-installer" },
		-- ╭──────────────────────────────────────────────────────────╮
		-- │                      Autocompletion                      │
		-- ╰──────────────────────────────────────────────────────────╯
		{ "hrsh7th/nvim-cmp" },
		-- -- cmp devicons appearance dependency
		{ "onsails/lspkind-nvim" },
		-- -- cmp plugins
		{ "hrsh7th/cmp-nvim-lsp" },
		{ "saadparwaiz1/cmp_luasnip" },
		{ "hrsh7th/cmp-path" },
		{ "hrsh7th/cmp-nvim-lsp-document-symbol" },
		{ "hrsh7th/cmp-buffer" },
		{ "hrsh7th/cmp-cmdline" },
		{ "octaltree/cmp-look" },
		{ "ray-x/cmp-treesitter" },
		{ "lukas-reineke/cmp-rg" },
		{ "lukas-reineke/cmp-under-comparator" },
		-- { "tzachar/cmp-tabnine", run = "./install.sh" },
		-- github copilot
		{ "github/copilot.vim" },
		{ "hrsh7th/cmp-copilot" },
		-- Inject Format, Diagnostics, Code Actions to Lsp
		{ "jose-elias-alvarez/null-ls.nvim" },
		{ "PlatyPew/format-installer.nvim" },
		-- Snippets plugin
		{ "L3MON4D3/LuaSnip" },
		-- spellcheck
		{ "kamykn/spelunker.vim" },
		-- tabout
		{ "abecodes/tabout.nvim" },
		-- Notification balloon
		{ "rcarriga/nvim-notify" },
		-- yank kill-ring
		{ "tversteeg/registers.nvim" },
		-- folding
		{ "anuvyklack/pretty-fold.nvim" },
		-- Faster f/f
		{ "ggandor/lightspeed.nvim" },
		-- fuzzy match easymotion
		{ "rlane/pounce.nvim" },
		-- surrounding plugin
		{ "machakann/vim-sandwich" },
		-- substitute operator
		{ "gbprod/substitute.nvim" },
		-- commenting
		{ "b3nj5m1n/kommentary" },
		-- comment eyecandies
		{ "LudoPinelli/comment-box.nvim" },
		-- multi cursor
		{ "mg979/vim-visual-multi" },
		-- Colorize brackets
		{ "p00f/nvim-ts-rainbow" },
		-- color highlighter
		{ "norcalli/nvim-colorizer.lua" },
		-- outline viewer
		-- { "simrat39/symbols-outline.nvim" },
		-- Discover available code action like VSCode
		{ "kosayoda/nvim-lightbulb" },
		-- code action modal
		{ "weilbith/nvim-code-action-menu" },
		-- Show matched information in search
		{ "kevinhwang91/nvim-hlslens" },
		-- Show keybindings
		{ "folke/which-key.nvim" },
		-- Problem view
		{ "folke/trouble.nvim" },
		{ "folke/todo-comments.nvim" },
		-- show signiture guides on type
		{ "ray-x/lsp_signature.nvim" },
		-- highlighting the word under cursor
		{ "RRethy/vim-illuminate" },
		-- Autopair
		{ "windwp/nvim-autopairs" },
		-- code biscuits, Bracket Lens-like plugin
		{ "code-biscuits/nvim-biscuits" },
		-- buffer bookmarks
		{ "MattesGroeger/vim-bookmarks" },
		-- project file anchor
		{ "ThePrimeagen/harpoon" },
		-- Better quickfix
		{ "kevinhwang91/nvim-bqf" },
		{ "stevearc/qf_helper.nvim" },
		-- Batch editing quickfix
		{ "gabrielpoca/replacer.nvim" },
		-- terminal integration
		{ "akinsho/toggleterm.nvim" },
		-- project management
		{ "ahmedkhalf/project.nvim" },
		-- automatic split management
		{ "beauwilliams/focus.nvim" },
		-- narrow region buffer
		-- { "chrisbra/NrrwRgn" },
		-- cpbooster, competitive programming cli tool
		{ "searleser97/cpbooster.vim" },
	})
end
load_plugins()

-- ╭──────────────────────────────────────────────────────────╮
-- │                      plugin config                      │
-- ╰──────────────────────────────────────────────────────────╯

-- mapping sugar syntax
require("mapx").setup({ global = true }) -- global keymap helper

-- require plugin's config helper
local p = function(name)
	return string.format("plugins-config.%s", name)
end

--- themes
local function load_theme()
	require(p("catppuccin")).config()
end
load_theme()

-- load plugin configs
local function load_configs()
	require(p("nvim-cmp")).config() -- completion retaled bundle
	require(p("autopairs")).config()
	require(p("autosave")).config()
	require(p("better_escape")).config()
	require(p("biscuits")).config()
	require(p("tabby")).config()
	require(p("vim-ctrlspace")).config()
	require(p("copilot")).config()
	require(p("colorizer")).config()
	require(p("dressing")).config()
	require(p("focus")).config()
	require(p("gestures")).config()
	require(p("gitsigns")).config()
	require(p("kommentary")).config()
	require(p("harpoon")).config()
	require(p("indent-blankline")).config()
	require(p("lightbulb")).config()
	require(p("lsp_signature")).config()
	require(p("lualine")).config()
	require(p("neogit")).config()
	require(p("notify")).config()
	-- require(p("nvim-tree")).config()
	require(p("nvim-treesitter")).config()
	require(p("pretty-fold")).config()
	require(p("qf_helper")).config()
	require(p("registers")).config()
	require(p("sandwich")).config()
	require(p("spectre")).config()
	require(p("substitute")).config()
	-- require(p("symbols-outline")).config()
	require(p("tabout")).config()
	require(p("telescope")).config()
	require(p("todo-comments")).config()
	require(p("toggleterm")).config()
	require(p("treesitter-unit")).config()
	require(p("trouble")).config()
	require(p("vim-bookmarks")).config()
	require(p("which-key")).config()
	-- require(p("auto-session")).config()
	require(p("neovim-session-manager")).config()
	require(p("hlslens")).config()
	require(p("scrollbar")).config()
	require(p("treesitter-context")).config()
	require(p("nvim-gps")).config()
	require(p("twilight")).config()
	require(p("vim-illuminate")).config()
	require(p("spelunker")).config()
	require(p("numb")).config()
	require(p("neogen")).config()
end
load_configs()
