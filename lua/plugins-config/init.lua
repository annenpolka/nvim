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
vim.cmd([[autocmd BufWritePost init.lua PackerCompile]])

-- ╭──────────────────────────────────────────────────────────╮
-- │                      plugins loading                     │
-- ╰──────────────────────────────────────────────────────────╯
require("packer").startup(function(use)
	use({ "wbthomason/packer.nvim" })
	-- lua loading optimizer
	use({
		"lewis6991/impatient.nvim",
	})
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
	use({ "stevearc/dressing.nvim" })
	-- sudo
	use({ "lambdalisue/suda.vim" })
	-- Session manager
	use({ "Shatur/neovim-session-manager" })
	-- Close buffer/window/vim wisely
	use({ "mhinz/vim-sayonara" })
	-- automatic indent detection
	use({ "tpope/vim-sleuth" })
	-- Better Escape
	use({ "max397574/better-escape.nvim" })
	-- Better line number jump with peek
	use({ "nacro90/numb.nvim" })
	-- autosave
	use({ "Pocco81/AutoSave.nvim" })
	-- mouse gestures
	use({ "notomo/gesture.nvim" })
	-- readline keybindings in insert mode
	use({ "tpope/vim-rsi" })
	-- switch working directory
	use({ "nyngwang/NeoRoot.lua" })
	-- ╭──────────────────────────────────────────────────────────╮
	-- │                        Git related                       │
	-- ╰──────────────────────────────────────────────────────────╯
	-- git diff viewer
	use({ "sindrets/diffview.nvim" })
	-- Magit-like git plugin
	use({ "TimUntersberger/neogit" })
	-- Add git related info in the signs columns and popups
	use({ "lewis6991/gitsigns.nvim" })
	-- Github editor
	use({ "pwntester/octo.nvim" })
	-- ╭──────────────────────────────────────────────────────────╮
	-- │                           files                          │
	-- ╰──────────────────────────────────────────────────────────╯
	-- search buffer
	use({ "nvim-pack/nvim-spectre" })
	-- Automatic tags management
	-- use{ "ludovicchabant/vim-gutentags" },
	-- UI to select things (files, grep results, open buffers...)
	use({ "nvim-telescope/telescope.nvim" })
	use({ "nvim-telescope/telescope-fzy-native.nvim" })
	use({ "nvim-telescope/telescope-file-browser.nvim" })
	-- file manager
	-- use{ "kyazdani42/nvim-tree.lua" },
	use({ "elihunter173/dirbuf.nvim" })
	-- ╭──────────────────────────────────────────────────────────╮
	-- │                       text editing                       │
	-- ╰──────────────────────────────────────────────────────────╯
	-- yank kill-ring
	use({ "tversteeg/registers.nvim" })
	-- comment eyecandies
	use({ "LudoPinelli/comment-box.nvim" })
	-- buffer bookmarks
	use({ "MattesGroeger/vim-bookmarks" })
	-- undo-tree
	use({ "simnalamburt/vim-mundo" })
	-- switch keywords
	use({ "AndrewRadev/switch.vim" })
	-- split/join lines
	use({ "AndrewRadev/splitjoin.vim" })
	-- ╭──────────────────────────────────────────────────────────╮
	-- │                           theme                          │
	-- ╰──────────────────────────────────────────────────────────╯
	-- Theme inspired by Atom
	use({ "joshdick/onedark.vim" })
	-- github theme
	-- use{ "projekt0n/github-nvim-theme" },
	-- catppuccin theme
	use({ "catppuccin/nvim", as = "catppuccin" })
	-- tokyonight theme
	use({ "folke/tokyonight.nvim" })
	-- nightfox theme
	use({ "EdenEast/nightfox.nvim" })
	-- Everforest theme
	use({ "sainnhe/everforest" })
	-- gruvbox theme
	use({ "eddyekofo94/gruvbox-flat.nvim" })
	-- aquarium theme
	use({ "FrenzyExists/aquarium-vim" })
	-- ╭──────────────────────────────────────────────────────────╮
	-- │                     lines and widgets                    │
	-- ╰──────────────────────────────────────────────────────────╯
	-- bufferline
	-- use{ "akinsho/bufferline.nvim" },
	-- tabline
	use({ "nanozuki/tabby.nvim" })
	-- Fancier statusline
	use({ "nvim-lualine/lualine.nvim" })
	use({ "windwp/windline.nvim" })
	-- scrollbar with search info
	use({ "petertriho/nvim-scrollbar" })
	-- Add indentation guides even on blank lines
	use({ "lukas-reineke/indent-blankline.nvim" })
	-- ╭──────────────────────────────────────────────────────────╮
	-- │                        treesitter                        │
	-- ╰──────────────────────────────────────────────────────────╯
	use({ "nvim-treesitter/nvim-treesitter" })
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
	use({ "ray-x/lsp_signature.nvim" })
	-- code outline
	use({ "stevearc/aerial.nvim" })
	-- ╭──────────────────────────────────────────────────────────╮
	-- │                      Autocompletion                      │
	-- ╰──────────────────────────────────────────────────────────╯
	use({ "hrsh7th/nvim-cmp" })
	-- -- cmp devicons appearance dependency
	use({ "onsails/lspkind-nvim" })
	-- -- cmp plugins
	use({ "hrsh7th/cmp-nvim-lsp" })
	use({ "saadparwaiz1/cmp_luasnip" })
	use({ "hrsh7th/cmp-path" })
	use({ "hrsh7th/cmp-nvim-lsp-document-symbol" })
	use({ "hrsh7th/cmp-buffer" })
	use({ "hrsh7th/cmp-cmdline" })
	use({ "octaltree/cmp-look" })
	use({ "ray-x/cmp-treesitter" })
	use({ "lukas-reineke/cmp-rg" })
	use({ "lukas-reineke/cmp-under-comparator" })
	-- use{ "tzachar/cmp-tabnine", run = "./install.sh" },
	-- github copilot
	use({ "github/copilot.vim" })
	use({ "hrsh7th/cmp-copilot" })
	-- Inject Format, Diagnostics, Code Actions to Lsp
	use({ "jose-elias-alvarez/null-ls.nvim" })
	use({ "PlatyPew/format-installer.nvim" })
	-- Snippets plugin
	use({ "L3MON4D3/LuaSnip" })
	-- snippets bundle
	use({ "rafamadriz/friendly-snippets" })
	-- ╭──────────────────────────────────────────────────────────╮
	-- │                          debug                           │
	-- ╰──────────────────────────────────────────────────────────╯
	-- Debug Adapter Protocol
	use({ "mfussenegger/nvim-dap" })
	-- DAP UI
	use({ "rcarriga/nvim-dap-ui" })
	-- vitrual text
	use({ "theHamsta/nvim-dap-virtual-text" })
	-- DAP Installer
	use({ "Pocco81/DAPInstall.nvim" })
	-- async task runners
	use({ "skywind3000/asyncrun.vim" })
	use({ "skywind3000/asynctasks.vim" })
	-- ╭──────────────────────────────────────────────────────────╮
	-- │                           Misc                           │
	-- ╰──────────────────────────────────────────────────────────╯
	-- spellcheck
	use({ "kamykn/spelunker.vim" })
	-- tabout
	use({ "abecodes/tabout.nvim" })
	-- Notification balloon
	use({ "rcarriga/nvim-notify" })
	-- folding
	use({ "anuvyklack/pretty-fold.nvim" })
	-- Faster f/f
	use({ "ggandor/lightspeed.nvim" })
	-- fuzzy match easymotion
	use({ "rlane/pounce.nvim" })
	-- hop easymotion
	use({ "phaazon/hop.nvim", branch = "v1" })
	-- surrounding plugin
	use({ "machakann/vim-sandwich" })
	-- substitute operator
	use({ "gbprod/substitute.nvim" })
	-- commenting
	use({ "b3nj5m1n/kommentary" })
	-- multi cursor
	use({ "mg979/vim-visual-multi" })
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
	use({ "folke/which-key.nvim" })
	-- Problem view
	use({ "folke/trouble.nvim" })
	use({ "folke/todo-comments.nvim" })
	-- highlighting the word under cursor
	use({ "RRethy/vim-illuminate" })
	-- Autopair
	use({ "windwp/nvim-autopairs" })
	-- code biscuits, Bracket Lens-like plugin
	use({ "code-biscuits/nvim-biscuits" })
	-- project file anchor
	use({ "ThePrimeagen/harpoon" })
	-- Better quickfix
	use({ "kevinhwang91/nvim-bqf" })
	use({ "stevearc/qf_helper.nvim" })
	-- Batch editing quickfix
	use({ "gabrielpoca/replacer.nvim" })
	-- terminal integration
	use({ "akinsho/toggleterm.nvim" })
	-- project management
	use({ "ahmedkhalf/project.nvim" })
	-- automatic split management
	use({ "beauwilliams/focus.nvim" })
	-- Zen mode
	use({ "folke/zen-mode.nvim" })
	-- narrow region buffer
	-- use{ "chrisbra/NrrwRgn" },
	-- show inline git blame
	use({ "APZelos/blamer.nvim" })
	-- json viewer
	use({ "gennaro-tedesco/nvim-jqx" })
	-- cpbooster, competitive programming cli tool
	use({ "searleser97/cpbooster.vim" })
	if packer_bootstrap then
		require("packer").sync()
	end
end)

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
	require(p("everforest")).config()
end
load_theme()

-- load plugin configs
local function load_configs()
	require(p("nvim-cmp")).config() -- completion related bundle
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
	require(p("zen-mode")).config()
	require(p("blamer")).config()
	require(p("dirbuf")).config()
	require(p("octo")).config()
	require(p("hop")).config()
	require(p("dap")).config() -- dap-related bundle
end
load_configs()
