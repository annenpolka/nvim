-- Install packer
vim.cmd([[packadd packer.nvim]])
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	vim.fn.execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
end

require("impatient") -- optimize loading

vim.cmd([[
  augroup Packer
    autocmd!
    autocmd BufWritePost init.lua PackerCompile
  augroup end
]])

-- packer configuration
local packer = require("packer")
packer.init({
	compile_path = vim.fn.stdpath("config") .. "/lua/packer_compiled.lua", -- for impatient.nvim's optimization
	display = {
		open_fn = require("packer.util").float,
	},
})
-- -- plugins
local use = packer.use
require("packer").startup(function()
	use({ "wbthomason/packer.nvim" }) -- Package manager
	use("lewis6991/impatient.nvim") -- Optimize Lua modules loading
	use("tpope/vim-fugitive") -- Git commands in nvim
	use("tpope/vim-rhubarb") -- Fugitive-companion to interact with github
	-- Magit-like git plugin
	use({
		"TimUntersberger/neogit",
		requires = {
			"nvim-lua/plenary.nvim",
			"sindrets/diffview.nvim",
		},
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
	use({ "nvim-telescope/telescope.nvim", requires = { "nvim-lua/plenary.nvim" } })
	-- file manager
	use({
		"kyazdani42/nvim-tree.lua",
		requires = { "kyazdani42/nvim-web-devicons", "antoinemadec/FixCursorHold.nvim" },
	})
	use("joshdick/onedark.vim") -- Theme inspired by Atom
	use("sainnhe/sonokai") -- sonokai theme
	use("projekt0n/github-nvim-theme") -- github theme
	use({
		"akinsho/bufferline.nvim",
		requires = "kyazdani42/nvim-web-devicons",
	})
	use("itchyny/lightline.vim") -- Fancier statusline
	-- Add indentation guides even on blank lines
	use("lukas-reineke/indent-blankline.nvim")
	-- Add git related info in the signs columns and popups
	use({ "lewis6991/gitsigns.nvim", requires = { "nvim-lua/plenary.nvim" } })
	-- Highlight, edit, and navigate code using a fast incremental parsing library
	use("nvim-treesitter/nvim-treesitter")
	-- Additional textobjects for treesitter
	use({ "nvim-treesitter/nvim-treesitter-textobjects", requires = { "nvim-treesitter/nvim-treesitter" } })
	use({
		"neovim/nvim-lspconfig", -- Collection of configurations for built-in LSP client
		"williamboman/nvim-lsp-installer", --  To Install LSP Automatically with LspInstall
	})
	use("hrsh7th/nvim-cmp") -- Autocompletion plugin
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
	-- Open lazygit in neovim
	use("kdheepak/lazygit.nvim")
	-- autosave
	use("Pocco81/AutoSave.nvim")
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
	})
end)

-- bufferline configuration
require("bufferline").setup()
vim.api.nvim_set_keymap("n", "<tab>", "<cmd>BufferLineCycleNext<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<S-tab>", "<cmd>BufferLineCycleNext<CR>", { noremap = true, silent = true })

-- quickfix autocmd
vim.cmd([[
  augroup QfAutoCommands
    autocmd!
    autocmd QuickfixCmdPost make,vimgrep cwindow " autoopen Quickfix
    autocmd WinEnter * if (winnr('$') == 1) && (getbufvar(winbufnr(0), '&buftype')) == 'quickfix' | quit | endif " autoclose when quit
  augroup end]])

-- autoread
vim.g.autoread = true
-- autosave
local autosave = require("autosave")
autosave.setup({
	enabled = true,
	execution_message = "AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"),
	events = { "InsertLeave", "TextChanged" },
	conditions = {
		exists = true,
		filename_is_not = {},
		filetype_is_not = {},
		modifiable = true,
	},
	write_all_buffers = false,
	on_off_commands = true,
	clean_command_line_interval = 0,
	debounce_delay = 10000,
})

-- Copy to system clipboard
vim.o.clipboard = "unnamedplus"

-- Show cursorline
vim.wo.cursorline = true

--Set highlight on search
vim.o.hlsearch = true

--Make line numbers default
vim.wo.number = true

--Enable mouse mode
vim.o.mouse = "a"

--Enable break indent
vim.o.breakindent = true

-- Tab indent settings
vim.bo.tabstop = 2
vim.bo.shiftwidth = 2
vim.bo.expandtab = true -- replace TAB char to spaces
vim.bo.autoindent = true
vim.bo.smartindent = true

--Save undo history
vim.opt.undofile = true
--Save with <c-s>
vim.api.nvim_set_keymap("n", "<c-s>", "<cmd>w<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<c-s>", "<esc><cmd>w<CR>", { noremap = true, silent = true })

--Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

--Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = "yes"

-- Set colorscheme (order is important here)
vim.o.termguicolors = true
require("github-theme").setup({
	theme_style = "dimmed",
	-- other config
})

--Set statusbar
vim.g.lightline = {
	colorscheme = "onedark",
	active = { left = { { "mode", "paste" }, { "gitbranch", "readonly", "filename", "modified" } } },
	component_function = { gitbranch = "fugitive#head" },
}

-- folding settings
vim.wo.foldcolumn = "1" -- visualize folding by column
vim.wo.foldenable = false -- no auto folding
vim.wo.foldlevel = 999 -- don't fold everything
vim.wo.foldnestmax = 3
vim.wo.foldminlines = 3
vim.wo.foldtext =
	[[substitute(getline(v:foldstart),'\\t',repeat('\ ',&tabstop),'g').'...'.trim(getline(v:foldend)) . ' (' . (v:foldend - v:foldstart + 1) . ' lines)']]
-- -- treesitter expr based folding
vim.wo.foldmethod = "expr"
vim.wo.foldexpr = "nvim_treesitter#foldexpr()"
-- -- keymaps
vim.api.nvim_set_keymap("n", "<c-j>", "zo", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<c-k>", "zc", { noremap = true, silent = true })

--Remap space as leader key
vim.api.nvim_set_keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

--Remap for dealing with word wrap
vim.api.nvim_set_keymap("n", "k", "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true })
vim.api.nvim_set_keymap("n", "j", "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true })

-- Map jk Escape
vim.api.nvim_set_keymap("i", "jk", "<esc>", { noremap = true })

-- Highlight on yank
vim.cmd([[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]])

--Map blankline
vim.g.indent_blankline_char = "┊"
vim.g.indent_blankline_filetype_exclude = { "help", "packer" }
vim.g.indent_blankline_buftype_exclude = { "terminal", "nofile" }
vim.g.indent_blankline_show_trailing_blankline_indent = false
vim.g.indent_blankline_context_patterns = {
	"abstract_class_declaration",
	"abstract_method_signature",
	"accessibility_modifier",
	"ambient_declaration",
	"arguments",
	"array",
	"array_pattern",
	"array_type",
	"arrow_function",
	"as_expression",
	"asserts",
	"assignment_expression",
	"assignment_pattern",
	"augmented_assignment_expression",
	"await_expression",
	"binary_expression",
	"break_statement",
	"call_expression",
	"call_signature",
	"catch_clause",
	"class",
	"class_body",
	"class_declaration",
	"class_heritage",
	"computed_property_name",
	"conditional_type",
	"constraint",
	"construct_signature",
	"constructor_type",
	"continue_statement",
	"debugger_statement",
	"declaration",
	"decorator",
	"default_type",
	"do_statement",
	"else_clause",
	"empty_statement",
	"enum_assignment",
	"enum_body",
	"enum_declaration",
	"existential_type",
	"export_clause",
	"export_specifier",
	"export_statement",
	"expression",
	"expression_statement",
	"extends_clause",
	"finally_clause",
	"flow_maybe_type",
	"for_in_statement",
	"for_statement",
	"formal_parameters",
	"function",
	"function_declaration",
	"function_signature",
	"function_type",
	"generator_function",
	"generator_function_declaration",
	"generic_type",
	"if_statement",
	"implements_clause",
	"import",
	"import_alias",
	"import_clause",
	"import_require_clause",
	"import_specifier",
	"import_statement",
	"index_signature",
	"index_type_query",
	"infer_type",
	"interface_declaration",
	"internal_module",
	"intersection_type",
	"jsx_attribute",
	"jsx_closing_element",
	"jsx_element",
	"jsx_expression",
	"jsx_fragment",
	"jsx_namespace_name",
	"jsx_opening_element",
	"jsx_self_closing_element",
	"labeled_statement",
	"lexical_declaration",
	"literal_type",
	"lookup_type",
	"mapped_type_clause",
	"member_expression",
	"meta_property",
	"method_definition",
	"method_signature",
	"module",
	"named_imports",
	"namespace_import",
	"nested_identifier",
	"nested_type_identifier",
	"new_expression",
	"non_null_expression",
	"object",
	"object_assignment_pattern",
	"object_pattern",
	"object_type",
	"omitting_type_annotation",
	"opting_type_annotation",
	"optional_parameter",
	"optional_type",
	"pair",
	"pair_pattern",
	"parenthesized_expression",
	"parenthesized_type",
	"pattern",
	"predefined_type",
	"primary_expression",
	"program",
	"property_signature",
	"public_field_definition",
	"readonly_type",
	"regex",
	"required_parameter",
	"rest_pattern",
	"rest_type",
	"return_statement",
	"sequence_expression",
	"spread_element",
	"statement",
	"statement_block",
	"string",
	"subscript_expression",
	"switch_body",
	"switch_case",
	"switch_default",
	"switch_statement",
	"template_string",
	"template_substitution",
	"ternary_expression",
	"throw_statement",
	"try_statement",
	"tuple_type",
	"type_alias_declaration",
	"type_annotation",
	"type_arguments",
	"type_parameter",
	"type_parameters",
	"type_predicate",
	"type_predicate_annotation",
	"type_query",
	"unary_expression",
	"union_type",
	"update_expression",
	"variable_declaration",
	"variable_declarator",
	"while_statement",
	"with_statement",
	"yield_expression",
}
require("indent_blankline").setup({
	space_char_blankline = " ",
	show_current_context = true,
	show_current_context_start = true,
})

-- Gitsigns
require("gitsigns").setup({
	signs = {
		add = { hl = "GitGutterAdd", text = "+" },
		change = { hl = "GitGutterChange", text = "~" },
		delete = { hl = "GitGutterDelete", text = "_" },
		topdelete = { hl = "GitGutterDelete", text = "‾" },
		changedelete = { hl = "GitGutterChange", text = "~" },
	},
})

-- Telescope
require("telescope").setup({
	defaults = {
		mappings = {
			i = {
				["<C-u>"] = false,
				["<C-d>"] = false,
			},
		},
	},
})
--Add leader shortcuts
vim.api.nvim_set_keymap(
	"n",
	"<leader><space>",
	[[<cmd>lua require('telescope.builtin').buffers()<CR>]],
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>sf",
	[[<cmd>lua require('telescope.builtin').find_files({previewer = false})<CR>]],
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>sb",
	[[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>]],
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>sh",
	[[<cmd>lua require('telescope.builtin').help_tags()<CR>]],
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>st",
	[[<cmd>lua require('telescope.builtin').tags()<CR>]],
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>sd",
	[[<cmd>lua require('telescope.builtin').grep_string()<CR>]],
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>sp",
	[[<cmd>lua require('telescope.builtin').live_grep()<CR>]],
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>so",
	[[<cmd>lua require('telescope.builtin').tags{ only_current_buffer = true }<CR>]],
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>?",
	[[<cmd>lua require('telescope.builtin').oldfiles()<CR>]],
	{ noremap = true, silent = true }
)
-- -- project.nvim configuration
require("project_nvim").setup({})
require("telescope").load_extension("projects")
vim.api.nvim_set_keymap("n", "<leader>p", "<cmd>Telescope projects<cr>", { silent = true, noremap = true })

-- nvim-tree.lua file manager
-- -- options
vim.g.nvim_tree_quit_on_open = 1
local tree_cb = require("nvim-tree.config").nvim_tree_callback
require("nvim-tree").setup({
	disable_netrw = true,
	hijack_netrw = true,
	open_on_setup = false,
	ignore_ft_on_setup = {},
	auto_close = true,
	open_on_tab = false,
	hijack_cursor = true,
	update_cwd = true,
	update_to_buf_dir = {
		enable = true,
		auto_open = true,
	},
	diagnostics = {
		enable = false,
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		},
	},
	update_focused_file = {
		enable = true,
		update_cwd = true,
		ignore_list = {},
	},
	system_open = {
		cmd = nil,
		args = {},
	},
	filters = {
		dotfiles = false,
		custom = {},
	},
	git = {
		enable = true,
		ignore = true,
		timeout = 500,
	},
	view = {
		width = 30,
		height = 30,
		hide_root_folder = false,
		side = "left",
		auto_resize = false,
		-- keybindings inside nvimtree
		mappings = {
			custom_only = false,
			list = {
				{ key = { "<CR>", "o", "<2-LeftMouse>", "l" }, cb = tree_cb("edit") },
				{ key = { "h" }, cb = tree_cb("close_node") },
			},
		},
		number = false,
		relativenumber = false,
		signcolumn = "yes",
	},
	trash = {
		cmd = "trash",
		require_confirm = true,
	},
})
-- -- mapping outside nvimtree
vim.api.nvim_set_keymap("n", "<c-e>", "<cmd>NvimTreeToggle<CR>", { noremap = true, silent = true })

-- Treesitter configuration
-- Parsers must be installed manually via :TSInstall
require("nvim-treesitter.configs").setup({
	ensure_installed = "maintained",
	highlight = {
		enable = true, -- false will disable the whole extension
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "gnn",
			node_incremental = "grn",
			scope_incremental = "grc",
			node_decremental = "grm",
		},
	},
	indent = {
		enable = true,
	},
	textobjects = {
		select = {
			enable = true,
			lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
			keymaps = {
				-- You can use the capture groups defined in textobjects.scm
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ac"] = "@class.outer",
				["ic"] = "@class.inner",
			},
		},
		move = {
			enable = true,
			set_jumps = true, -- whether to set jumps in the jumplist
			goto_next_start = {
				["]m"] = "@function.outer",
				["]]"] = "@class.outer",
			},
			goto_next_end = {
				["]M"] = "@function.outer",
				["]["] = "@class.outer",
			},
			goto_previous_start = {
				["[m"] = "@function.outer",
				["[["] = "@class.outer",
			},
			goto_previous_end = {
				["[M"] = "@function.outer",
				["[]"] = "@class.outer",
			},
		},
	},
	-- nvim-ts-rainbow
	rainbow = {
		enable = true,
		-- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
		extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
		max_file_lines = nil, -- Do not enable for files with more than n lines, int
		-- colors = {}, -- table of hex strings
		-- termcolors = {} -- table of colour name strings
	},
})
-- Code Biscuits
local biscuits = require("nvim-biscuits").setup({
	toggle_keybind = "<leader>bs",
	show_on_start = true,
	cursor_line_only = false,
	default_config = {
		max_length = 120,
		min_distance = 3,
		prefix_string = "<- ",
	},
	language_config = {
		python = {
			disabled = true,
		},
	},
})

-- LSP settings
local lspconfig = require("lspconfig")
local on_attach = function(_, bufnr)
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	local opts = { noremap = true, silent = true }
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-S-K>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
	vim.api.nvim_buf_set_keymap(
		bufnr,
		"n",
		"<leader>wl",
		"<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>",
		opts
	)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	-- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ca", "<cmd>CodeActionMenu<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>e", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
	vim.api.nvim_buf_set_keymap(
		bufnr,
		"n",
		"<leader>so",
		[[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]],
		opts
	)
	vim.cmd([[ command! Format execute 'lua vim.lsp.buf.formatting()' ]])
	-- lsp_signature initialize
	require("lsp_signature").setup({
		hint_enable = true,
		max_width = 120,
	})
	-- -- format before saving
	vim.api.nvim_command([[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()]])
end

-- Lsp diagnostic symbols
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- nvim-cmp supports additional completion capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

local lsp_installer = require("nvim-lsp-installer")
lsp_installer.on_server_ready(function(server)
	local opts = {}
	opts.on_attach = on_attach
	opts.capabilities = capabilities
	server:setup(opts)
end)

-- Enable the following language servers manually
local servers = { "ccls" }
for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
end

-- null-ls configuration
local null_ls = require("null-ls")
-- -- detect eslint config
local has_eslint_config = function(u)
	return u.root_has_file(".eslintrc")
		or u.root_has_file(".eslintrc.json")
		or u.root_has_file(".eslintrc.js")
		or u.root_has_file("package.json")
		or u.root_has_file(".eslintrc.cjs")
		or u.root_has_file(".eslintrc.yaml")
		or u.root_has_file(".eslintrc.yml")
end
-- -- setup
require("null-ls").setup({
	debug = true,
	sources = {
		-- eslint, prettier
		null_ls.builtins.code_actions.eslint_d.with({
			condition = has_eslint_config,
			prefer_local = "node_modules/.bin",
		}),
		null_ls.builtins.diagnostics.eslint_d.with({
			condition = has_eslint_config,
			prefer_local = "node_modules/.bin",
		}),
		null_ls.builtins.formatting.eslint_d.with({
			condition = has_eslint_config,
			prefer_local = "node_modules/.bin",
		}),
		null_ls.builtins.formatting.prettier.with({
			prefer_local = "node_modules/.bin",
		}),
		-- stylua
		null_ls.builtins.formatting.stylua,
		-- c++
		--[[ null_ls.builtins.formatting.clang_format.with({
      extra_args = {"--style=Google"}
    }), ]]
		null_ls.builtins.diagnostics.cppcheck,
	},
})

-- Set completeopt to have a better completion experience
vim.o.completeopt = "menuone,noselect"

-- spectre search configuration
require("spectre").setup({
	live_update = true,
	open_cmd = "new",
})

vim.api.nvim_set_keymap("n", "<leader>f", "<cmd>lua require('spectre').open()<CR>", { noremap = true, silent = true })

-- luasnip setup
local luasnip = require("luasnip")
local snippets = require("my_snippets")

-- nvim-cmp setup
local cmp = require("cmp")
cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = {
		["<C-p>"] = cmp.mapping.select_prev_item(),
		["<C-n>"] = cmp.mapping.select_next_item(),
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-l>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.close(),
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		}),
		["<Tab>"] = function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end,
		["<S-Tab>"] = function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end,
	},
	sources = {
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "cmp_tabnine" },
	},
})

-- If you want insert `(` after select function or method item
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))

-- cmp-tabnine config
local tabnine = require("cmp_tabnine.config")
tabnine:setup({
	max_lines = 1000,
	max_num_results = 20,
	sort = true,
	run_on_every_keystroke = true,
	snippet_placeholder = "..",
	ignored_file_types = { -- default is not to ignore
		-- uncomment to ignore in lua:
		-- lua = true
	},
})

-- Replace notify with nvim-notify
vim.notify = require("notify")

-- Neogit Settings
-- -- keymap
vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>Neogit<CR>", { noremap = true })
-- -- setup
local neogit = require("neogit")
neogit.setup({
	integrations = {
		diffview = true, -- set diffview.nvim integration
	},
})

-- lazygit keymaps
vim.api.nvim_set_keymap("n", "<leader>G", "<cmd>LazyGit<CR>", { noremap = true })

-- easymotion settings
-- -- keymap
vim.api.nvim_set_keymap("n", "S", "<cmd>FuzzyMotion<CR>", { noremap = false })

-- kommentary
-- -- keymap
vim.api.nvim_set_keymap("n", "<leader>cic", "<Plug>kommentary_line_increase", {})
vim.api.nvim_set_keymap("n", "<leader>ci", "<Plug>kommentary_motion_increase", {})
vim.api.nvim_set_keymap("x", "<leader>ci", "<Plug>kommentary_visual_increase", {})
vim.api.nvim_set_keymap("n", "<leader>cdc", "<Plug>kommentary_line_decrease", {})
vim.api.nvim_set_keymap("n", "<leader>cd", "<Plug>kommentary_motion_decrease", {})
vim.api.nvim_set_keymap("x", "<leader>cd", "<Plug>kommentary_visual_decrease", {})
vim.api.nvim_set_keymap("n", "<C-_>", "<Plug>kommentary_line_default", {})
vim.api.nvim_set_keymap("v", "<C-_>", "<Plug>kommentary_visual_default<C-c>", {})

-- symbols-outlines.nvim for outline view
-- -- keymap
vim.api.nvim_set_keymap("n", "<leader>o", "<cmd>SymbolsOutline<CR>", { noremap = true })
-- -- options
vim.g.symbols_outline = {
	highlight_hovered_item = true,
	show_guides = true,
	auto_preview = true,
	position = "right",
	relative_width = true,
	width = 50,
	auto_close = false,
	show_numbers = false,
	show_relative_numbers = false,
	show_symbol_details = true,
	preview_bg_highlight = "Pmenu",
	keymaps = { -- These keymaps can be a string or a table for multiple keys
		close = { "<Esc>", "q" },
		goto_location = "<Cr>",
		focus_location = "o",
		hover_symbol = "<C-space>",
		toggle_preview = "K",
		rename_symbol = "r",
		code_actions = "aaaaa",
	},
	lsp_blacklist = {},
	symbol_blacklist = {},
	symbols = {
		File = { icon = "", hl = "TSURI" },
		Module = { icon = "", hl = "TSNamespace" },
		Namespace = { icon = "", hl = "TSNamespace" },
		Package = { icon = "", hl = "TSNamespace" },
		Class = { icon = "𝓒", hl = "TSType" },
		Method = { icon = "ƒ", hl = "TSMethod" },
		Property = { icon = "", hl = "TSMethod" },
		Field = { icon = "", hl = "TSField" },
		Constructor = { icon = "", hl = "TSConstructor" },
		Enum = { icon = "ℰ", hl = "TSType" },
		Interface = { icon = "ﰮ", hl = "TSType" },
		Function = { icon = "", hl = "TSFunction" },
		Variable = { icon = "", hl = "TSConstant" },
		Constant = { icon = "", hl = "TSConstant" },
		String = { icon = "𝓐", hl = "TSString" },
		Number = { icon = "#", hl = "TSNumber" },
		Boolean = { icon = "⊨", hl = "TSBoolean" },
		Array = { icon = "", hl = "TSConstant" },
		Object = { icon = "⦿", hl = "TSType" },
		Key = { icon = "🔐", hl = "TSType" },
		Null = { icon = "NULL", hl = "TSType" },
		EnumMember = { icon = "", hl = "TSField" },
		Struct = { icon = "𝓢", hl = "TSType" },
		Event = { icon = "🗲", hl = "TSType" },
		Operator = { icon = "+", hl = "TSOperator" },
		TypeParameter = { icon = "𝙏", hl = "TSParameter" },
	},
}

-- nvim-lightbulb for all filetypes
vim.cmd([[autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()]])

-- nvim-hlslens
-- -- keymaps
vim.api.nvim_set_keymap("n", "n", [[n<Cmd>lua require('hlslens').start()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "N", [[N<Cmd>lua require('hlslens').start()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "*", [[*<Cmd>lua require('hlslens').start()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "#", [[#<Cmd>lua require('hlslens').start()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "g*", [[g*<Cmd>lua require('hlslens').start()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "g#", [[g#<Cmd>lua require('hlslens').start()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>l", ":nohl<CR>", { noremap = true, silent = true })

-- trouble.nvim
-- -- kermaps
vim.api.nvim_set_keymap("n", "<leader>xx", "<cmd>Trouble<cr>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "<leader>xw", "<cmd>Trouble workspace_diagnostics<cr>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "<leader>xd", "<cmd>Trouble document_diagnostics<cr>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "<leader>xl", "<cmd>Trouble loclist<cr>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "<leader>xq", "<cmd>Trouble quickfix<cr>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "gR", "<cmd>Trouble lsp_references<cr>", { silent = true, noremap = true })

-- toggleterm.nvim, terminal integration
require("toggleterm").setup({
	open_mapping = [[<c-t>]],
})
