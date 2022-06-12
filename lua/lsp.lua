-- ╭──────────────────────────────────────────────────────────╮
-- │                       LSP setting                        │
-- ╰──────────────────────────────────────────────────────────╯
local lspconfig = require("lspconfig")
local capabilities = vim.lsp.protocol.make_client_capabilities()
-- setting format option by lsp-format.nvim
require("lsp-format").setup({
	force = false,
	lua = {
		exclude = { "sumneko_lua" },
		order = { "null-ls" },
	},
})
vim.cmd([[cabbrev wq execute "Format sync" <bar> wq]]) -- format on exit

local on_attach = function(client, bufnr)
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
	local opts = { buffer = bufnr }
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
	vim.keymap.set("n", "gh", vim.lsp.buf.hover, opts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
	-- vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
	vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
	vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
	vim.keymap.set("n", "<leader>wl", function()
		vim.inspect(vim.lsp.buf.list_workspace_folders())
	end, opts)
	vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
	vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
	-- vim.keymap.set("n", "<leader>rn", "<Cmd>lua require('cosmic-ui').rename()<CR>", opts)
	vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
	vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
	vim.keymap.set("v", "<Leader>ca", ":<C-u>lua vim.lsp.buf.range_code_action()<CR>", { silent = true })
	vim.keymap.set("n", "<leader>so", require("telescope.builtin").lsp_document_symbols, opts)
	-- diagnostic keymap
	vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
	vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
	vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
	vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)
	vim.api.nvim_create_user_command("FormatBuiltin", vim.lsp.buf.formatting_seq_sync, {})
	-- attach lsp-format.nvim
	require("lsp-format").on_attach(client)
	-- attach aerial
	require("aerial").on_attach(client, bufnr)
	-- attach nvim-navic breadcrumb
	require("nvim-navic").attach(client, bufnr)
end

-- Lsp diagnostic symbols
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- workaround about offset encoding
capabilities.offsetEncoding = { "utf-16" }

-- nvim-cmp supports additional completion capabilities
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

-- ╭──────────────────────────────────────────────────────────╮
-- │          nvim-lspconfig with nvim-lsp-installer          │
-- ╰──────────────────────────────────────────────────────────╯
local lsp_installer = require("nvim-lsp-installer")
local server_list = {
	"sumneko_lua",
	"vimls",
	"rust_analyzer",
	"clangd",
	"gopls",
	"omnisharp",
	"pyright",
	"hls",
	"html",
	"tsserver",
	"volar",
	"emmet_ls",
	"prosemd_lsp",
	"dockerls",
}
lsp_installer.setup({
	-- ensure_installed = server_list,
	automatic_installation = { exclude = { "hls", "omnisharp" } },
})
local common_opts = { on_attach = on_attach, capabilities = capabilities }

-- Enable the following language servers with common_opts
for _, lsp in ipairs(server_list) do
	local ignore_server_list = { "rust_analyzer", "clangd", "sumneko_lua" } -- setup with dedicated settings
	for _, ignore_server in ipairs(ignore_server_list) do
		if lsp ~= ignore_server then
			lspconfig[lsp].setup(common_opts)
		end
	end
end

-- sumneko_lua config
-- Make runtime files discoverable to the server
local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")
lspconfig.sumneko_lua.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
				-- Setup your lua path
				path = runtime_path,
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim" },
			},
			completion = {
				keywordSnippet = "Replace",
				-- arguments completion
				callSnippet = "Replace",
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				-- library = vim.api.nvim_get_runtime_file("", true),
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			},
		},
	},
})

-- rust-analyzer config
local rust_opts = { on_attach = on_attach, capabilities = capabilities }
rust_opts.settings = {
	["rust-analyzer"] = {
		-- use clippy linter
		checkOnSave = {
			allFeatures = true,
			overrideCommand = {
				"cargo",
				"clippy",
				"--workspace",
				"--message-format=json",
				"--all-targets",
				"--all-features",
			},
		},
	},
}
require("rust-tools").setup({
	server = rust_opts,
})

-- clangd config
local clangd_opts = { on_attach = on_attach, capabilities = capabilities }
clangd_opts.cmd = {
	-- see clangd --help-hidden
	"clangd",
	"--background-index",
	"--pch-storage=memory",
	"--enable-config", -- clangd 11+ supports reading from .clangd configuration file
	"--fallback-style=Google",
	"--clang-tidy",
	-- "--clang-tidy-checks=*", deprecated, use `.clang-tidy` file for project, `~/.config/clangd/config.yaml` for global
	"--all-scopes-completion",
	"--completion-style=bundled",
	"--cross-file-rename",
	"--header-insertion=iwyu",
}
require("clangd_extensions").setup({
	server = clangd_opts,
	extensions = {
		-- defaults:
		-- Automatically set inlay hints (type hints)
		autoSetHints = true,
		-- Whether to show hover actions inside the hover window
		-- This overrides the default hover handler
		hover_with_actions = true,
		-- These apply to the default ClangdSetInlayHints command
		inlay_hints = {
			-- Only show inlay hints for the current line
			only_current_line = false,
			-- Event which triggers a refersh of the inlay hints.
			-- You can make this "CursorMoved" or "CursorMoved,CursorMovedI" but
			-- not that this may cause  higher CPU usage.
			-- This option is only respected when only_current_line and
			-- autoSetHints both are true.
			only_current_line_autocmd = "CursorHold",
			-- whether to show parameter hints with the inlay hints or not
			show_parameter_hints = true,
			-- prefix for parameter hints
			parameter_hints_prefix = "<- ",
			-- prefix for all the other hints (type, chaining)
			other_hints_prefix = "=> ",
			-- whether to align to the length of the longest line in the file
			max_len_align = false,
			-- padding from the left if max_len_align is true
			max_len_align_padding = 1,
			-- whether to align to the extreme right or not
			right_align = false,
			-- padding from the right if right_align is true
			right_align_padding = 7,
			-- The color of the hints
			highlight = "Comment",
		},
	},
})

-- ╭──────────────────────────────────────────────────────────╮
-- │                  null-ls configuration                   │
-- ╰──────────────────────────────────────────────────────────╯
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
-- -- format-installer configuration
local formatter_install = require("format-installer")

-- ensure_install by format-installer
local ensure_install_formatter_list = {
	"stylua",
	"black",
	"prettierd",
	"eslint_d",
	"rustywind",
}
-- for _, v in pairs(ensure_install_formatter_list) do
-- 	local is_installed = require("format-installer").is_installed(v)
-- 	if not is_installed then
-- 		require("format-installer").install_formatter(v)
-- 	end
-- end

-- add sources managed by format-installer.nvim
local formatter_managed = {}
for _, formatter in ipairs(formatter_install.get_installed_formatters()) do
	local config = { command = formatter.cmd }
	table.insert(formatter_managed, null_ls.builtins.formatting[formatter.name].with(config))
end
-- -- add predefined sources
local formatter_predefined = {
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
	-- stylua for lua
	null_ls.builtins.formatting.stylua,
	-- gitsigns integration
	null_ls.builtins.code_actions.gitsigns,
	-- markdown tools
	null_ls.builtins.code_actions.proselint, -- english prose linter
	null_ls.builtins.diagnostics.write_good, -- also english prose linter
	null_ls.builtins.diagnostics.alex, -- polite writing diagnostics
}
for _, v in pairs(formatter_predefined) do
	table.insert(formatter_managed, v)
end

-- -- setup
require("null-ls").setup({
	debug = false,
	sources = formatter_managed,
	on_attach = function(client)
		require("lsp-format").on_attach(client)
	end,
})
