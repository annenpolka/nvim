-- optimize loading
-- require("impatient").enable_profile()
-- initialize util function aliases
local fn = vim.fn

-- ╭──────────────────────────────────────────────────────────╮
-- │                      plugins loading                     │
-- ╰──────────────────────────────────────────────────────────╯
-- vim.cmd("packadd vim-jetpack")
require("jetpack").startup(function(use)
    use({ "tani/vim-jetpack", opt = true })
    -- lua loading optimizer
    -- use({ "lewis6991/impatient.nvim" })
    -- faster filetype
    use({"nathom/filetype.nvim"})
    -- ╭──────────────────────────────────────────────────────────╮
    -- │                    runtime, dependency                   │
    -- ╰──────────────────────────────────────────────────────────╯
    use({"kyazdani42/nvim-web-devicons"})
    use({"nvim-lua/plenary.nvim"})
    use({"MunifTanjim/nui.nvim"})
    use({"kamykn/popup-menu.nvim"})
    -- use{ "vim-denops/denops.vim" },
    -- fzf
    use({
        "junegunn/fzf",
        run = function()
            fn["fzf#install"]()
        end
    })
    -- mapping helper functions
    use({"b0o/mapx.nvim"})
    -- extended dot repeat
    use({"tpope/vim-repeat"})
    ---------------------------------------------------------------------------------
    -- ╭──────────────────────────────────────────────────────────╮
    -- │                          Utility                         │
    -- ╰──────────────────────────────────────────────────────────╯
    -- fix cursorhold performance problem
    use({"antoinemadec/FixCursorHold.nvim"})
    -- UI overhaul
    use({"stevearc/dressing.nvim"})
    -- sudo
    use({"lambdalisue/suda.vim" -- opt = true,
    -- on = { "SudaWrite", "SudaRead" },
    })
    -- Session manager
    use({"Shatur/neovim-session-manager"})
    -- Close buffer/window/vim wisely
    use({"mhinz/vim-sayonara" -- opt = true,
    -- on = { "Sayonara", "Sayonara!" },
    })
    -- automatic indent detection
    use({"tpope/vim-sleuth"})
    -- Better Escape
    use({"max397574/better-escape.nvim" -- opt = true,
    -- on = "InsertEnter",
    })
    -- Better line number jump with peek
    use({"nacro90/numb.nvim" -- opt = true,
    -- on = "CmdlineEnter",
    })
    -- autosave
    use({"Pocco81/AutoSave.nvim" -- opt = true,
    })
    -- mouse gestures
    use({"notomo/gesture.nvim" -- opt = true,
    })
    -- readline keybindings in insert mode
    use({"tpope/vim-rsi" -- on = "InsertEnter",
    })
    -- switch working directory
    use({"nyngwang/NeoRoot.lua" -- opt = true,
    -- on = {
    -- 	"NeoRoot",
    -- 	"NeoRootChange",
    -- 	"NeoRootSwitchMode",
    -- },
    })
    use({"sbulav/nredir.nvim"})
    -- ╭──────────────────────────────────────────────────────────╮
    -- │                        Git related                       │
    -- ╰──────────────────────────────────────────────────────────╯
    -- git diff viewer
    use({"sindrets/diffview.nvim" -- opt = true,
    -- on = "Neogit",
    })
    -- Magit-like git plugin
    use({"TimUntersberger/neogit" -- opt = true,
    -- on = "Neogit",
    })
    -- Add git related info in the signs columns and popups
    use({"lewis6991/gitsigns.nvim" -- on = "BufRead",
    })
    -- Github editor
    use({"pwntester/octo.nvim" -- on = "CmdlineEnter",
    })
    -- ╭──────────────────────────────────────────────────────────╮
    -- │                           files                          │
    -- ╰──────────────────────────────────────────────────────────╯
    -- search buffer
    use({"nvim-pack/nvim-spectre" -- on = "BufWinEnter",
    })
    -- Automatic tags management
    -- use{ "ludovicchabant/vim-gutentags" },
    -- UI to select things (files, grep results, open buffers...)
    use({"nvim-telescope/telescope.nvim"})
    use({"nvim-telescope/telescope-file-browser.nvim" -- requires = "nvim-telescope/telescope.nvim",
    })
    use({"nvim-telescope/telescope-frecency.nvim" -- requires = { "nvim-telescope/telescope.nvim", "tami5/sqlite.lua" },
    })
    use({"willthbill/opener.nvim" -- requires = "nvim-telescope/telescope.nvim",
    })
    -- file manager
    -- use{ "kyazdani42/nvim-tree.lua" },
    use({"elihunter173/dirbuf.nvim" -- on = "Dirbuf",
    })
    -- ╭──────────────────────────────────────────────────────────╮
    -- │                       text editing                       │
    -- ╰──────────────────────────────────────────────────────────╯
    -- yank kill-ring
    use({"tversteeg/registers.nvim"})
    -- comment eyecandies
    use({"LudoPinelli/comment-box.nvim" -- opt = true,
    })
    -- buffer bookmarks
    use({"MattesGroeger/vim-bookmarks"})
    -- undo-tree
    use({"simnalamburt/vim-mundo" -- opt = true,
    })
    -- switch keywords
    use({"AndrewRadev/switch.vim" -- opt = true,
    })
    use({"Matt-A-Bennett/vim-surround-funk" -- opt = true,
    })
    -- find a unique character in each word
    use({"unblevable/quick-scope" -- opt = true,
    })
    -- split/join lines
    use({"AndrewRadev/splitjoin.vim" -- opt = true,
    })
    -- non-lsp formatter
    use({"sbdchd/neoformat"})
    -- ╭──────────────────────────────────────────────────────────╮
    -- │                          themes                          │
    -- ╰──────────────────────────────────────────────────────────╯
    -- Theme inspired by Atom
    use({"joshdick/onedark.vim"})
    -- github theme
    -- use{ "projekt0n/github-nvim-theme" },
    -- catppuccin theme
    -- use({ "catppuccin/nvim", as = "catppuccin" })
    -- tokyonight theme
    -- use({ "folke/tokyonight.nvim" })
    -- nightfox theme
    -- use({ "EdenEast/nightfox.nvim" })
    -- Everforest theme
    -- use({
    -- 	"sainnhe/everforest",
    -- 	config = function()
    -- 		-- require("plugins-config.everforest").config()
    -- 	end,
    -- on = "BufRead",
    -- })
    -- gruvbox theme
    -- use({ "eddyekofo94/gruvbox-flat.nvim" })
    -- aquarium theme
    -- use({
    -- 	"FrenzyExists/aquarium-vim",
    -- 	config = function()
    -- 		-- require("plugins-config.aquarium").config()
    -- 	end,
    -- })
    -- use({
    -- 	"mcchrish/zenbones.nvim",
    -- 	requires = "rktjmp/lush.nvim",
    -- 	config = function()
    -- 		-- require("plugins-config.zenbones").config()
    -- 	end,
    -- })
    use({"annenpolka/no-clown-fiesta.nvim"})
    -- ╭──────────────────────────────────────────────────────────╮
    -- │                     lines and widgets                    │
    -- ╰──────────────────────────────────────────────────────────╯
    -- bufferline
    -- use{ "akinsho/bufferline.nvim" },
    -- tabline
    use({"nanozuki/tabby.nvim" -- on = "BufWinEnter",
    })
    -- Fancier statusline
    use({"nvim-lualine/lualine.nvim" -- on = "BufRead",
    })
    -- scrollbar with search info
    use({"petertriho/nvim-scrollbar"})
    -- Add indentation guides even on blank lines
    use({"lukas-reineke/indent-blankline.nvim" -- on = "BufRead",
    })
    use({"echasnovski/mini.nvim"})
    -- ╭──────────────────────────────────────────────────────────╮
    -- │                        treesitter                        │
    -- ╰──────────────────────────────────────────────────────────╯
    use({
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate"
    })
    -- playground
    use({"nvim-treesitter/playground"})
    -- Limelighting
    use({"folke/twilight.nvim"})
    -- treesitter-based context viewer
    use({"romgrk/nvim-treesitter-context"})
    -- breadcrumb
    use({"SmiteshP/nvim-gps"})
    -- Additional textobjects for treesitter
    use({"nvim-treesitter/nvim-treesitter-textobjects"})
    -- html autotag
    use({"windwp/nvim-ts-autotag"})
    -- textobject unit helper
    use({"David-Kunz/treesitter-unit"})
    -- select textobject with hints
    use({"mfussenegger/nvim-treehopper"})
    -- refactoring support
    use({"ThePrimeagen/refactoring.nvim"})
    -- Generate annotation
    use({"danymat/neogen"})
    -- Bracket Lens-like plugin
    use({"haringsrob/nvim_context_vt"})
    use({"andymass/vim-matchup"})
    -- ╭──────────────────────────────────────────────────────────╮
    -- │                            LSP                           │
    -- ╰──────────────────────────────────────────────────────────╯
    -- Collection of configurations for built-in LSP client
    use({"neovim/nvim-lspconfig"})
    --  To Install LSP Automatically with LspInstall
    use({"williamboman/nvim-lsp-installer"})
    -- rust lsp tools
    use({"simrat39/rust-tools.nvim"})
    -- show signature guides on type
    use({"ray-x/lsp_signature.nvim"})
    -- code outline
    use({"stevearc/aerial.nvim"})
    -- Inject Format, Diagnostics, Code Actions to Lsp
    use({"jose-elias-alvarez/null-ls.nvim"})
    use({"PlatyPew/format-installer.nvim"})
    -- ╭──────────────────────────────────────────────────────────╮
    -- │                      Autocompletion                      │
    -- ╰──────────────────────────────────────────────────────────╯
    use({"hrsh7th/nvim-cmp" -- on = { "InsertEnter", "CmdlineEnter" },
    })
    -- -- cmp devicons appearance dependency
    use({"onsails/lspkind-nvim" -- after = "nvim-cmp",
    })
    -- -- cmp plugins
    use({"hrsh7th/cmp-nvim-lsp" -- after = "nvim-cmp",
    })
    use({"saadparwaiz1/cmp_luasnip" -- after = "nvim-cmp",
    })
    use({"hrsh7th/cmp-path" -- after = "nvim-cmp",
    })
    use({"hrsh7th/cmp-nvim-lsp-document-symbol" -- after = "nvim-cmp",
    })
    use({"hrsh7th/cmp-buffer" -- after = "nvim-cmp",
    })
    use({"hrsh7th/cmp-cmdline" -- after = "nvim-cmp",
    })
    use({"octaltree/cmp-look" -- after = "nvim-cmp",
    })
    use({"ray-x/cmp-treesitter" -- after = "nvim-cmp",
    })
    use({"lukas-reineke/cmp-rg" -- after = "nvim-cmp",
    })
    use({"lukas-reineke/cmp-under-comparator" -- after = "nvim-cmp",
    })
    -- use{ "tzachar/cmp-tabnine", run = "./install.sh" },
    -- github copilot
    use({"github/copilot.vim"})
    use({"hrsh7th/cmp-copilot" -- after = "nvim-cmp",
    })
    -- Snippets plugin
    use({"L3MON4D3/LuaSnip" -- after = "nvim-cmp",
    })
    -- snippets bundle
    use({"rafamadriz/friendly-snippets" -- on = "InsertEnter",
    -- after = "nvim-cmp",
    })
    -- ╭──────────────────────────────────────────────────────────╮
    -- │                          debug                           │
    -- ╰──────────────────────────────────────────────────────────╯
    -- Debug Adapter Protocol
    use({"mfussenegger/nvim-dap" -- opt = true,
    })
    -- DAP UI
    use({"rcarriga/nvim-dap-ui" -- after = "nvim-dap",
    })
    -- vitrual text
    use({"theHamsta/nvim-dap-virtual-text" -- after = "nvim-dap",
    })
    -- DAP Installer
    use({"Pocco81/DAPInstall.nvim" -- after = "nvim-dap",
    })
    -- async task runners
    use({"skywind3000/asyncrun.vim"})
    use({"skywind3000/asynctasks.vim" -- after = "asyncrun.vim",
    })
    -- ╭──────────────────────────────────────────────────────────╮
    -- │                           Misc                           │
    -- ╰──────────────────────────────────────────────────────────╯
    -- spellcheck
    use({"kamykn/spelunker.vim"})
    -- tabout
    use({"abecodes/tabout.nvim" -- on = "InsertEnter",
    })
    -- Notification balloon
    use({"rcarriga/nvim-notify"})
    -- folding
    use({"anuvyklack/pretty-fold.nvim"})
    -- Faster f/f
    use({"ggandor/lightspeed.nvim" -- opt = false,
    })
    -- fuzzy match easymotion
    -- use({ "rlane/pounce.nvim" })
    -- hop easymotion
    use({
        "phaazon/hop.nvim",
        branch = "master"
        -- on = {
        -- 	"HopWord",
        -- 	"HopWordBC",
        -- 	"HopWordAC",
        -- 	"HopWordCurrentLine",
        -- 	"HopWordCurrentLineBC",
        -- 	"HopWordCurrentLineAC",
        -- 	"HopLine",
        -- 	"HopLineAC",
        -- 	"HopLineBC",
        -- 	"HopChar1",
        -- 	"HopChar1AC",
        -- 	"HopChar1BC",
        -- 	"HopChar2",
        -- 	"HopChar2AC",
        -- 	"HopChar2BC",
        -- 	"HopPattern",
        -- 	"HopPatternAC",
        -- 	"HopPatternBC",
        -- },
    })
    -- surrounding plugin
    use({"machakann/vim-sandwich"})
    -- substitute operator
    use({"gbprod/substitute.nvim"})
    -- commenting
    use({"b3nj5m1n/kommentary" -- opt = true,
    })
    -- multi cursor
    use({"mg979/vim-visual-multi" -- opt = true,
    })
    -- Colorize brackets
    use({"p00f/nvim-ts-rainbow"})
    -- color highlighter
    use({"norcalli/nvim-colorizer.lua"})
    -- outline viewer
    -- use{ "simrat39/symbols-outline.nvim" },
    -- Discover available code action like VSCode
    use({"kosayoda/nvim-lightbulb"})
    -- code action modal
    use({"weilbith/nvim-code-action-menu"})
    -- Show matched information in search
    use({"kevinhwang91/nvim-hlslens"})
    -- Show keybindings
    use({"folke/which-key.nvim" -- opt = true,
    })
    -- Problem view
    use({"folke/trouble.nvim" -- opt = true,
    })
    use({"folke/todo-comments.nvim"})
    -- highlighting the word under cursor
    use({"RRethy/vim-illuminate"})
    -- Autopair
    use({"windwp/nvim-autopairs" -- opt = true,
    })
    -- project file anchor
    use({"ThePrimeagen/harpoon" -- opt = true,
    })
    -- Better quickfix
    use({"kevinhwang91/nvim-bqf"})
    use({"stevearc/qf_helper.nvim"})
    -- Batch editing quickfix
    use({"gabrielpoca/replacer.nvim"})
    -- terminal integration
    use({"akinsho/toggleterm.nvim" -- on = "BufWinEnter",
    })
    -- project management
    use({"ahmedkhalf/project.nvim"})
    -- automatic split management
    use({"beauwilliams/focus.nvim"})
    -- Zen mode
    use({"folke/zen-mode.nvim" -- on = "ZenMode",
    })
    -- region buffer window
    use({"hoschi/yode-nvim" -- on = "BufRead",
    })
    -- show inline git blame
    use({"APZelos/blamer.nvim" -- on = "BufRead",
    })
    -- json viewer
    use({
        "gennaro-tedesco/nvim-jqx",
        ft = "json"
    })
    -- cpbooster, competitive programming cli tool
    use({"searleser97/cpbooster.vim" -- opt = true,
    })
end)

-- ╭──────────────────────────────────────────────────────────╮
-- │                      plugin config                       │
-- ╰──────────────────────────────────────────────────────────╯

-- mapping sugar syntax
require("mapx").setup({
    global = true
}) -- global keymap helper

-- config loading autocmd
local function load_config()
    -- load on start
    require("plugins-config.vim-bookmarks").config()
    require("plugins-config.vim-illuminate").config()
    -- lazyload
    vim.cmd([[autocmd! User dressing lua require("plugins-config.dressing").config()]])
    vim.cmd([[autocmd! User neovim-session-manager lua require("plugins-config.neovim-session-manager").config()]])
    vim.cmd([[autocmd! User vim-sayonara lua require("plugins-config.sayonara").config()]])
    vim.cmd([[autocmd! User better-escape.nvim lua require("plugins-config.better-escape").config()]])
    vim.cmd([[autocmd! User numb.nvim lua require("plugins-config.numb").config()]])
    vim.cmd([[autocmd! User AutoSave.nvim lua require("plugins-config.autosave").config()]])
    vim.cmd([[autocmd! User gesture.nvim lua require("plugins-config.gesture").config()]])
    vim.cmd([[autocmd! User neogit lua require("plugins-config.neogit").config()]])
    vim.cmd([[autocmd! User gitsigns.nvim lua require("plugins-config.gitsigns").config()]])
    vim.cmd([[autocmd! User octo.nvim lua require("plugins-config.octo").config()]])
    vim.cmd([[autocmd! User nvim-spectre lua require("plugins-config.spectre").config()]])
    vim.cmd([[autocmd! User telescope.nvim lua require("plugins-config.telescope").config()]])
    vim.cmd([[autocmd! User dirbuf.nvim lua require("plugins-config.dirbuf").config()]])
    vim.cmd([[autocmd! User registers.nvim lua require("plugins-config.registers").config()]])
    vim.cmd([[autocmd! User registers.nvim lua require("plugins-config.registers").config()]])
    vim.cmd([[autocmd! User no-clown-fiesta.nvim colorscheme no-clown-fiesta]])
    vim.cmd([[autocmd! User tabby.nvim lua require("plugins-config.tabby").config()]])
    vim.cmd([[autocmd! User lualine.nvim lua require("plugins-config.lualine").config()]])
    vim.cmd([[autocmd! User nvim-scrollbar lua require("plugins-config.scrollbar").config()]])
    vim.cmd([[autocmd! User indent-blankline.nvim lua require("plugins-config.indent-blankline").config()]])
    vim.cmd(
        [[autocmd! User mini.nvim lua require("plugins-config.mini-starter").config() | lua require("plugins-config.mini-starter").config()]])
    vim.cmd([[autocmd! User nvim-treesitter lua require("plugins-config.nvim-treesitter").config()]])
    vim.cmd([[autocmd! User twilight.nvim lua require("plugins-config.twilight").config()]])
    vim.cmd([[autocmd! User nvim-treesitter-context lua require("plugins-config.treesitter-context").config()]])
    vim.cmd([[autocmd! User nvim-gps lua require("plugins-config.nvim-gps").config()]])
    vim.cmd([[autocmd! User treesitter-unit lua require("plugins-config.treesitter-unit").config()]])
    vim.cmd([[autocmd! User nvim-treehopper lua require("plugins-config.nvim-treehopper").config()]])
    vim.cmd([[autocmd! User neogen lua require("plugins-config.neogen").config()]])
    vim.cmd([[autocmd! User nvim_context_vt lua require("plugins-config.context_vt").config()]])
    vim.cmd([[autocmd! User vim-matchup lua require("plugins-config.matchup").config()]])
    vim.cmd([[autocmd! User lsp_signature.nvim lua require("plugins-config.lsp_signature").config()]])
    vim.cmd([[autocmd! User aerial.nvim lua require("plugins-config.aerial").config()]])
    vim.cmd([[autocmd! User nvim-cmp lua require("plugins-config.nvim-cmp").config()]])
    vim.cmd([[autocmd! User copilot.vim lua require("plugins-config.copilot").config()]])
    vim.cmd([[autocmd! User nvim-dap lua require("plugins-config.dap").config()]])
    vim.cmd([[autocmd! User spelunker.vim lua require("plugins-config.spelunker").config()]])
    vim.cmd([[autocmd! User tabout.nvim lua require("plugins-config.tabout").config()]])
    vim.cmd([[autocmd! User nvim-notify lua require("plugins-config.notify").config()]])
    vim.cmd([[autocmd! User pretty-fold.nvim lua require("plugins-config.pretty-fold").config()]])
    vim.cmd([[autocmd! User hop.nvim lua require("plugins-config.hop").config()]])
    vim.cmd([[autocmd! User vim-sandwich lua require("plugins-config.sandwich").config()]])
    vim.cmd([[autocmd! User substitute.nvim lua require("plugins-config.substitute").config()]])
    vim.cmd([[autocmd! User kommentary lua require("plugins-config.kommentary").config()]])
    vim.cmd([[autocmd! User nvim-colorizer.lua lua require("plugins-config.colorizer").config()]])
    vim.cmd([[autocmd! User nvim-lightbulb lua require("plugins-config.lightbulb").config()]])
    vim.cmd([[autocmd! User nvim-hlslens lua require("plugins-config.hlslens").config()]])
    vim.cmd([[autocmd! User which-key.nvim lua require("plugins-config.which-key").config()]])
    vim.cmd([[autocmd! User trouble.nvim lua require("plugins-config.trouble").config()]])
    vim.cmd([[autocmd! User todo-comments.nvim lua require("plugins-config.todo-comments").config()]])
    vim.cmd([[autocmd! User nvim-autopairs lua require("plugins-config.autopairs").config()]])
    vim.cmd([[autocmd! User harpoon lua require("plugins-config.harpoon").config()]])
    vim.cmd([[autocmd! User qf_helper.nvim lua require("plugins-config.qf_helper").config()]])
    vim.cmd([[autocmd! User toggleterm.nvim lua require("plugins-config.toggleterm").config()]])
    vim.cmd([[autocmd! User focus.nvim lua require("plugins-config.focus").config()]])
    vim.cmd([[autocmd! User zen-mode.nvim lua require("plugins-config.zen-mode").config()]])
    vim.cmd([[autocmd! User yode-nvim lua require("plugins-config.yode").config()]])
    vim.cmd([[autocmd! User blamer.nvim lua require("plugins-config.blamer").config()]])
end
