-- LSP setting
local lspconfig = require("lspconfig")
local configs = require("lspconfig.configs")
local on_attach = function(client, bufnr)
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
	-- -- format before saving
	vim.api.nvim_command([[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()]])
	-- attach aerial
	require("aerial").on_attach(client, bufnr)
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
	local disable_lsp_formatter_list = { "sumneko_lua" }
	-- disable lsp's formatting on the list
	opts.on_attach = function(client, bufnr)
		for _, value in ipairs(disable_lsp_formatter_list) do
			if value == server.name then
				client.resolved_capabilities.document_formatting = false
				client.resolved_capabilities.document_range_formatting = false
				break
			end
		end
		on_attach(client, bufnr)
	end
	opts.capabilities = capabilities
	if server.name == "rust_analyzer" then
		-- Initialize the LSP via rust-tools instead
		require("rust-tools").setup({
			-- The "server" property provided in rust-tools setup function are the
			-- settings rust-tools will provide to lspconfig during init.            --
			-- We merge the necessary settings from nvim-lsp-installer (server:get_default_options())
			-- with the user's own settings (opts).
			server = vim.tbl_deep_extend("force", server:get_default_options(), opts),
		})
		server:attach_buffers()
	elseif server.name == "clangd" then
		require("clangd_extensions").setup({
			server = {
				server = vim.tbl_deep_extend("force", server:get_default_options(), opts),
			},
		})
	else
		server:setup(opts)
	end
end)
-- Enable the following language servers manually
local servers = {}
-- workaround about offset encoding
capabilities.offsetEncoding = { "utf-16" }
for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
end

-- emmet LSP configuration
-- HACK: This doesn't use nvim-lsp-installer's custom installer
capabilities.textDocument.completion.completionItem.snippetSupport = true
if not configs.ls_emmet then
	configs.ls_emmet = {
		default_config = {
			cmd = { "ls_emmet", "--stdio" },
			filetypes = {
				"html",
				"css",
				"scss",
				"javascript",
				"javascriptreact",
				"typescript",
				"typescriptreact",
				"haml",
				"xml",
				"xsl",
				"pug",
				"slim",
				"sass",
				"stylus",
				"less",
				"sss",
			},
			root_dir = function(fname)
				return vim.loop.cwd()
			end,
			settings = {},
		},
	}
end
lspconfig.ls_emmet.setup({ capabilities = capabilities })

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
-- -- format-installer configuration
local formatter_install = require("format-installer")

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
	-- stylua
	null_ls.builtins.formatting.stylua,
	-- c++
	--[[ null_ls.builtins.formatting.clang_format.with({
      extra_args = {"--style=Google"}
    }), ]]
	-- rust
	null_ls.builtins.formatting.rustfmt,
	-- spellcheck by cspell
	-- null_ls.builtins.diagnostics.cspell,

	-- spellsuggest
	null_ls.builtins.completion.spell,
}
for _, v in pairs(formatter_predefined) do
	table.insert(formatter_managed, v)
end

-- -- setup
require("null-ls").setup({
	debug = true,
	sources = formatter_managed,
})
