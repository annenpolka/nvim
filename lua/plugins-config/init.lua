-- optimize loading
require("impatient").enable_profile()

-- -- plugins
require("paq")({
	{ "savq/paq-nvim" },
	-- lua loading optimizer
	{ "lewis6991/impatient.nvim" },
	-- runtime, dependency----------------------------------------------------------
	{ "kyazdani42/nvim-web-devicons" },
	{ "nvim-lua/plenary.nvim" },
	{ "MunifTanjim/nui.nvim" },
	{ "vim-denops/denops.vim" },
	-- fzf
	{
		"junegunn/fzf",
		run = function()
			vim.fn["fzf#install"]()
		end,
	},
	---------------------------------------------------------------------------------
	-- UI overhaul
	{ "stevearc/dressing.nvim" },
	-- Close buffer/window/vim wisely
	{ "mhinz/vim-sayonara" },
	-- Better Escape
	{ "max397574/better-escape.nvim" },
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
	{ "ludovicchabant/vim-gutentags" },
	-- UI to select things (files, grep results, open buffers...)
	{ "nvim-telescope/telescope.nvim" },
	{ "nvim-telescope/telescope-file-browser.nvim" },
	-- file manager
	{ "kyazdani42/nvim-tree.lua" },
	{ "joshdick/onedark.vim" }, -- Theme inspired by Atom
	-- github theme
	-- { "projekt0n/github-nvim-theme" },
	-- catppuccin theme
	{ "catppuccin/nvim", as = "catppuccin" },
	-- bufferline
	{ "akinsho/bufferline.nvim" },
	-- Fancier statusline
	{ "nvim-lualine/lualine.nvim" },
	-- Add indentation guides even on blank lines
	{ "lukas-reineke/indent-blankline.nvim" },
	-- Highlight, edit, and navigate code using a fast incremental parsing library
	{ "nvim-treesitter/nvim-treesitter" },
	-- Additional textobjects for treesitter
	{ "nvim-treesitter/nvim-treesitter-textobjects" },
	-- html autotag
	{ "windwp/nvim-ts-autotag" },
	-- textobject unit helper
	{ "David-Kunz/treesitter-unit" },
	-- refactoring support
	{ "ThePrimeagen/refactoring.nvim" },
	-- Collection of configurations for built-in LSP client
	{ "neovim/nvim-lspconfig" },
	--  To Install LSP Automatically with LspInstall
	{ "williamboman/nvim-lsp-installer" },
	-- Autocompletion plugin
	{ "hrsh7th/nvim-cmp" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "saadparwaiz1/cmp_luasnip" },
	{ "hrsh7th/cmp-path" },
	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/cmp-cmdline" },
	{ "tzachar/cmp-tabnine", run = "./install.sh" },
	-- github copilot
	{ "github/copilot.vim" },
	{ "hrsh7th/cmp-copilot" },
	-- Inject Format, Diagnostics, Code Actions to Lsp
	{ "jose-elias-alvarez/null-ls.nvim" },
	{ "PlatyPew/format-installer.nvim" },
	-- Snippets plugin
	{ "L3MON4D3/LuaSnip" },
	-- tabout
	{ "abecodes/tabout.nvim" },
	-- Notification baloon
	{ "rcarriga/nvim-notify" },
	-- yank kill-ring
	{ "tversteeg/registers.nvim" },
	-- folding
	{ "anuvyklack/pretty-fold.nvim" },
	-- Faster f/f
	{ "ggandor/lightspeed.nvim" },
	{ "yuki-yano/fuzzy-motion.vim" },
	-- surrounding plugin
	{ "machakann/vim-sandwich" },
	-- substitute operator
	{ "gbprod/substitute.nvim" },
	-- commenting
	{ "b3nj5m1n/kommentary" },
	-- multi cursor
	{ "mg979/vim-visual-multi" },
	-- Colorize brackets
	{ "p00f/nvim-ts-rainbow" },
	-- outline viewer
	{ "simrat39/symbols-outline.nvim" },
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
	-- terminal integration
	{ "akinsho/toggleterm.nvim" },
	-- project management
	{ "ahmedkhalf/project.nvim" },
	-- automatic split management
	{ "beauwilliams/focus.nvim" },
	-- cpbooster, competitive programming cli tool
	{ "searleser97/cpbooster.vim" },
})

-- require plugin's config
local p = function(name)
	return string.format("plugins-config.%s", name)
end

require(p("nvim-cmp")).config() -- completion retaled bundle
require(p("autopairs")).config()
require(p("autosave")).config()
require(p("better_escape")).config()
require(p("biscuits")).config()
require(p("bufferline")).config()
require(p("copilot")).config()
require(p("dressing")).config()
require(p("focus")).config()
require(p("gestures")).config()
require(p("gestures")).config()
require(p("gitsigns")).config()
require(p("harpoon")).config()
require(p("indent-blankline")).config()
require(p("lightbulb")).config()
require(p("lsp_signature")).config()
require(p("lualine")).config()
require(p("neogit")).config()
require(p("notify")).config()
require(p("nvim-tree")).config()
require(p("nvim-treesitter")).config()
require(p("pretty-fold")).config()
require(p("registers")).config()
require(p("sandwich")).config()
require(p("spectre")).config()
require(p("substitute")).config()
require(p("symbols-outline")).config()
require(p("tabout")).config()
require(p("telescope")).config()
require(p("todo-comments")).config()
require(p("toggleterm")).config()
require(p("treesitter-unit")).config()
require(p("trouble")).config()
require(p("vim-bookmarks")).config()
require(p("which-key")).config()

--- themes
-- require(p("github-theme")).config()
require(p("catppuccin")).config()
