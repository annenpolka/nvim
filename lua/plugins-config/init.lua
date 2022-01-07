-- optimize loading
require("impatient").enable_profile()

-- require plugin's config
local p = function(name)
	return string.format("plugins-config.%s", name)
end

-- -- plugins
require("paq")({
	{ "savq/paq-nvim" },
	-- lua loading optimizer
	{ "lewis6991/impatient.nvim" },
	-- runtime, dependency----------------------------------------------------------
	{ "kyazdani42/nvim-web-devicons" },
	{ "nvim-lua/plenary.nvim" },
	{ "vim-denops/denops.vim" },
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
	require(p("autosave")).config(),
	-- mouse gestures
	{ "notomo/gesture.nvim" },
	require(p("gestures")).config(),
	{ "tpope/vim-fugitive" }, -- Git commands in nvim
	{ "tpope/vim-rhubarb" }, -- Fugitive-companion to interact with github
	{ "sindrets/diffview.nvim" }, -- git diff viewer
	-- Magit-like git plugin
	{ "TimUntersberger/neogit" },
	require(p("neogit")).config(),
	{ "nvim-pack/nvim-spectre" },
	require(p("spectre")).config(),
	-- Automatic tags management
	{ "ludovicchabant/vim-gutentags" },
	-- UI to select things (files, grep results, open buffers...)
	{ "nvim-telescope/telescope.nvim" },
	require(p("telescope")).config(),
	-- file manager
	{ "kyazdani42/nvim-tree.lua" },
	require(p("nvim-tree")).config(),
	-- onedark theme
	{ "joshdick/onedark.vim" }, -- Theme inspired by Atom
	-- github theme
	{ "projekt0n/github-nvim-theme" },
	require(p("github-theme")).config(),
	{ "akinsho/bufferline.nvim" },
	require(p("bufferline")).config(),
	-- Fancier statusline
	{ "itchyny/lightline.vim" },
	require(p("lightline")).config(),
	-- Add indentation guides even on blank lines
	{ "lukas-reineke/indent-blankline.nvim" },
	require(p("indent-blankline")).config(),
	-- Add git related info in the signs columns and popups
	{ "lewis6991/gitsigns.nvim" },
	require(p("gitsigns")).config(),
	-- Highlight, edit, and navigate code using a fast incremental parsing library
	{ "nvim-treesitter/nvim-treesitter" },
	require(p("nvim-treesitter")).config(),
	-- Additional textobjects for treesitter
	{ "nvim-treesitter/nvim-treesitter-textobjects" },
	{ "David-Kunz/treesitter-unit" },
	require(p("treesitter-unit")).config(),
	-- Collection of configurations for built-in LSP client
	{ "neovim/nvim-lspconfig" },
	--  To Install LSP Automatically with LspInstall
	{ "williamboman/nvim-lsp-installer" },
	-- Autocompletion plugin
	{ "hrsh7th/nvim-cmp" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "saadparwaiz1/cmp_luasnip" },
	{ "tzachar/cmp-tabnine", run = "./install.sh" },
	require(p("completion")).config(), -- completion retaled bundle
	-- github copilot
	{ "github/copilot.vim" },
	require(p("copilot")).config(),
	{ "hrsh7th/cmp-copilot" },
	-- Inject Format, Diagnostics, Code Actions to Lsp
	{ "jose-elias-alvarez/null-ls.nvim" },
	-- Snippets plugin
	{ "L3MON4D3/LuaSnip" },
	-- Notification baloon
	{ "rcarriga/nvim-notify" },
	require(p("notify")).config(),
	-- Faster f/f
	{ "ggandor/lightspeed.nvim" },
	{ "yuki-yano/fuzzy-motion.vim" },
	-- sandwiching plugin
	{ "machakann/vim-sandwich" },
	require(p("sandwich")).config(),
	-- commenting
	{ "b3nj5m1n/kommentary" },
	-- multi cursor
	{ "mg979/vim-visual-multi" },
	-- Colorize brackets
	{ "p00f/nvim-ts-rainbow" },
	-- outline viewer
	{ "simrat39/symbols-outline.nvim" },
	require(p("symbols-outline")).config(),
	-- Discover available code action like VSCode
	{ "kosayoda/nvim-lightbulb" },
	require(p("lightbulb")).config(),
	-- code action modal
	{ "weilbith/nvim-code-action-menu" },
	-- Show matched information in search
	{ "kevinhwang91/nvim-hlslens" },
	-- Show keybindings
	{ "folke/which-key.nvim" },
	require(p("which-key")).config(),
	-- Problem view
	{ "folke/trouble.nvim" },
	require(p("trouble")).config(),
	-- show signiture guides on type
	{ "ray-x/lsp_signature.nvim" },
	require(p("lsp_signature")).config(),
	-- Autopair
	{ "windwp/nvim-autopairs" },
	require(p("autopairs")).config(),
	-- code biscuits, Bracket Lens-like plugin
	{ "code-biscuits/nvim-biscuits" },
	require(p("biscuits")).config(),
	-- Better quickfix
	{ "kevinhwang91/nvim-bqf" },
	-- terminal integration
	{ "akinsho/toggleterm.nvim" },
	require(p("toggleterm")).config(),
	-- project management
	{ "ahmedkhalf/project.nvim" },
	-- automatic split management
	{ "beauwilliams/focus.nvim" },
	require(p("focus")).config(),
})
