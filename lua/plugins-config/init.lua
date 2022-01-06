-- optimize loading
require("impatient").enable_profile()

-- -- plugins
require("paq")({
	"savq/paq-nvim",
	-- lua loading optimizer
	"lewis6991/impatient.nvim",
	-- runtime, dependency----------------------------------------------------------
	"kyazdani42/nvim-web-devicons",
	"nvim-lua/plenary.nvim",
	-- fzf
	{
		"junegunn/fzf",
		run = function()
			vim.fn["fzf#install"]()
		end,
	},
	---------------------------------------------------------------------------------

	-- Close buffer/window/vim wisely
	{ "mhinz/vim-sayonara" },
	-- autosave
	{ "Pocco81/AutoSave.nvim" },
	{ "notomo/gesture.nvim" },
	"tpope/vim-fugitive", -- Git commands in nvim
	"tpope/vim-rhubarb", -- Fugitive-companion to interact with github
	"sindrets/diffview.nvim", -- git diff viewer
	-- Magit-like git plugin
	{
		"TimUntersberger/neogit",
	},
	"nvim-pack/nvim-spectre",
	-- Automatic tags management
	"ludovicchabant/vim-gutentags",
	-- UI to select things (files, grep results, open buffers...)
	{
		"nvim-telescope/telescope.nvim",
	},
	-- file manager
	{
		"kyazdani42/nvim-tree.lua",
	},
	"joshdick/onedark.vim", -- Theme inspired by Atom
	-- github theme
	{ "projekt0n/github-nvim-theme" },
	{
		"akinsho/bufferline.nvim",
	},
	-- Fancier statusline
	{ "itchyny/lightline.vim" },
	-- Add indentation guides even on blank lines
	{ "lukas-reineke/indent-blankline.nvim" },
	-- Add git related info in the signs columns and popups
	{ "lewis6991/gitsigns.nvim" },
	-- Highlight, edit, and navigate code using a fast incremental parsing library
	{ "nvim-treesitter/nvim-treesitter" },
	-- Additional textobjects for treesitter
	{ "nvim-treesitter/nvim-treesitter-textobjects" },
	-- Collection of configurations for built-in LSP client
	"neovim/nvim-lspconfig",
	--  To Install LSP Automatically with LspInstall
	"williamboman/nvim-lsp-installer",
	-- Autocompletion plugin
	{ "hrsh7th/nvim-cmp" },
	"hrsh7th/cmp-nvim-lsp",
	"saadparwaiz1/cmp_luasnip",
	{ "tzachar/cmp-tabnine", run = "./install.sh" },
	-- github copilot
	"github/copilot.vim",
	"hrsh7th/cmp-copilot",
	-- Inject Format, Diagnostics, Code Actions to Lsp
	{ "jose-elias-alvarez/null-ls.nvim" },
	-- Snippets plugin
	"L3MON4D3/LuaSnip",
	-- Notification baloon
	"rcarriga/nvim-notify",
	-- Faster f/f
	"ggandor/lightspeed.nvim",
	"yuki-yano/fuzzy-motion.vim",
	-- Surrounding plugin
	{ "blackCauldron7/surround.nvim" },
	"b3nj5m1n/kommentary",
	-- Colorize brackets
	{ "p00f/nvim-ts-rainbow" },
	-- outline viewer
	"simrat39/symbols-outline.nvim",
	-- Discover available code action like VSCode
	"kosayoda/nvim-lightbulb",
	-- code action modal
	{ "weilbith/nvim-code-action-menu" },
	-- Show matched information in search
	"kevinhwang91/nvim-hlslens",
	-- Show keybindings
	"folke/which-key.nvim",
	-- Problem view
	{ "folke/trouble.nvim" },
	-- show signiture guides on type
	"ray-x/lsp_signature.nvim",
	-- Autopair
	{ "windwp/nvim-autopairs" },
	-- code biscuits, Bracket Lens-like plugin
	{ "code-biscuits/nvim-biscuits" },
	-- Better quickfix
	{ "kevinhwang91/nvim-bqf" },
	-- terminal integration
	{ "akinsho/toggleterm.nvim" },
	-- project management
	{ "ahmedkhalf/project.nvim" },
	-- automatic split management
	{ "beauwilliams/focus.nvim" },
})

-- require plugin's config
local p = function(name)
	return string.format("plugins-config.%s", name)
end
require(p("completion")).config() -- completion retaled bundle
require(p("autopairs")).config()
require(p("autosave")).config()
require(p("biscuits")).config()
require(p("bufferline")).config()
require(p("copilot")).config()
require(p("gestures")).config()
require(p("focus")).config()
require(p("gestures")).config()
require(p("github-theme")).config()
require(p("gitsigns")).config()
require(p("indent-blankline")).config()
require(p("lightbulb")).config()
require(p("lightline")).config()
require(p("neogit")).config()
require(p("notify")).config()
require(p("nvim-tree")).config()
require(p("nvim-treesitter")).config()
require(p("spectre")).config()
require(p("surround")).config()
require(p("symbols-outline")).config()
require(p("telescope")).config()
require(p("toggleterm")).config()
require(p("trouble")).config()
require(p("which-key")).config()
