-- Install packer
vim.cmd([[packadd packer.nvim]])
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	vim.fn.execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
end

-- auto PackerCompile when init.lua updated
vim.cmd([[
  augroup Packer
    autocmd!
    autocmd BufWritePost init.lua PackerCompile
  augroup end
]])

-- optimize loading
require("impatient").enable_profile()

-- require plugin's config
local p = function(name)
	return string.format("require'plugins-config.%s'", name)
end

-- packer configuration
local packer = require("packer")
packer.init({
	display = {
		open_fn = require("packer.util").float, -- floating packer window
	},
})
-- -- plugins
local use = packer.use
require("packer").startup(function()
	use({ "wbthomason/packer.nvim" }) -- Package manager
	use("lewis6991/impatient.nvim") -- Optimize Lua modules loading
	-- Close buffer/window/vim wisely
	use({ "mhinz/vim-sayonara" })
	-- autosave
	use({ "Pocco81/AutoSave.nvim", config = p("autosave") .. ".config()" })
	use({ "notomo/gesture.nvim", config = p("gestures") .. ".config()" }) -- mouse gestures
	use("tpope/vim-fugitive") -- Git commands in nvim
	use("tpope/vim-rhubarb") -- Fugitive-companion to interact with github
	-- Magit-like git plugin
	use({
		"TimUntersberger/neogit",
		requires = {
			"nvim-lua/plenary.nvim",
			"sindrets/diffview.nvim",
		},
		config = p("neogit") .. ".config()",
	})
	use({ "sindrets/diffview.nvim", requires = { "kyazdani42/nvim-web-devicons" } }) -- diff viewer
	use({
		"nvim-pack/nvim-spectre",
		requires = {
			"kyazdani42/nvim-web-devicons",
			"nvim-lua/plenary.nvim",
		},
	})
	use("ludovicchabant/vim-gutentags") -- Automatic tags management
	-- UI to select things (files, grep results, open buffers...)
	use({
		"nvim-telescope/telescope.nvim",
		requires = { "nvim-lua/plenary.nvim" },
		config = p("telescope") .. ".config()",
	})
	-- file manager
	use({
		"kyazdani42/nvim-tree.lua",
		requires = { "kyazdani42/nvim-web-devicons", "antoinemadec/FixCursorHold.nvim" },
		config = p("nvim-tree") .. ".config()",
	})
	use("joshdick/onedark.vim") -- Theme inspired by Atom
	use({ "projekt0n/github-nvim-theme", config = p("github-theme") .. ".config()" }) -- github theme
	use({
		"akinsho/bufferline.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = p("bufferline") .. ".config()",
	})
	use({ "itchyny/lightline.vim", config = p("lightline") }) -- Fancier statusline
	-- Add indentation guides even on blank lines
	use({ "lukas-reineke/indent-blankline.nvim", config = p("indent-blankline") .. ".config()" })
	-- Add git related info in the signs columns and popups
	use({ "lewis6991/gitsigns.nvim", requires = { "nvim-lua/plenary.nvim" }, config = p("gitsigns") .. ".config()" })
	-- Highlight, edit, and navigate code using a fast incremental parsing library
	use({"nvim-treesitter/nvim-treesitter", config = p("nvim-treesitter") .. ".config()"
})
	-- Additional textobjects for treesitter
	use({ "nvim-treesitter/nvim-treesitter-textobjects", requires = { "nvim-treesitter/nvim-treesitter" } })
	use({
		"neovim/nvim-lspconfig", -- Collection of configurations for built-in LSP client
		"williamboman/nvim-lsp-installer", --  To Install LSP Automatically with LspInstall
	})
	use({"hrsh7th/nvim-cmp", config = p("nvim-cmp") .. ".config()"}) -- Autocompletion plugin
	use("hrsh7th/cmp-nvim-lsp")
	use("saadparwaiz1/cmp_luasnip")
	use({ "tzachar/cmp-tabnine", run = "./install.sh", requires = "hrsh7th/nvim-cmp" })
	-- Inject Format, Diagnostics, Code Actions to Lsp
	use({ "jose-elias-alvarez/null-ls.nvim", requires = { "nvim-lua/plenary.nvim" } })
	use("L3MON4D3/LuaSnip") -- Snippets plugin
	use("rcarriga/nvim-notify") -- Notification baloon
	use("ggandor/lightspeed.nvim") -- Faster f/F
	use({
		"yuki-yano/fuzzy-motion.vim",
		requires = {
			"vim-denops/denops.vim",
		},
	})
	-- Surrounding plugin
	use({
		"blackCauldron7/surround.nvim",
		config = function()
			require("surround").setup({ mappings_style = "sandwich" })
		end,
	})
	use("b3nj5m1n/kommentary") -- Commenting
	use({ "p00f/nvim-ts-rainbow", requires = { "nvim-treesitter/nvim-treesitter" } }) -- Colorize brackets
	use("simrat39/symbols-outline.nvim") -- outline viewer
	use("kosayoda/nvim-lightbulb") -- Discover available code action like VSCode
	use({
		"weilbith/nvim-code-action-menu",
		cmd = "CodeActionMenu",
	})
	use("kevinhwang91/nvim-hlslens") -- Show matched information in search
	-- Show keybindings which-key
	use({
		"folke/which-key.nvim", -- Show keybindings
		config = function()
			require("which-key").setup({})
		end,
	})
	-- Problem view
	use({
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("trouble").setup({
				-- your configuration comes here
			})
		end,
	})
	-- show signiture guides on type
	use("ray-x/lsp_signature.nvim")
	-- Autopair
	use({
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({
				check_ts = true,
			})
		end,
	})
	-- code biscuits, Bracket Lens-like plugin
	use({ "code-biscuits/nvim-biscuits", requires = { "nvim-treesitter/nvim-treesitter" } })
	-- Better quickfix
	use({ "kevinhwang91/nvim-bqf", requires = { "junegunn/fzf" } })
	-- fzf
	use({
		"junegunn/fzf",
		run = function()
			vim.fn["fzf#install"]()
		end,
	})
	-- terminal integration
	use({ "akinsho/toggleterm.nvim" })
	-- project management
	use({
		"ahmedkhalf/project.nvim",
		config = function()
			require("project_nvim").setup({})
			require("telescope").load_extension("projects")
		end,
	})
	-- automatic split management
	use({
		"beauwilliams/focus.nvim",
		config = function()
			require("focus").setup()
		end,
	})
end)
