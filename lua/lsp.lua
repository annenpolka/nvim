-- ╭──────────────────────────────────────────────────────────╮
-- │                       LSP setting                        │
-- ╰──────────────────────────────────────────────────────────╯
local lspconfig = require("lspconfig")
local capabilities = vim.lsp.protocol.make_client_capabilities()
local on_attach = function(client, bufnr)
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
	local opts = { noremap = true, silent = true }
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
	vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
	-- vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
	vim.keymap.set("n", "<leader>ca", "<cmd>CodeActionMenu<CR>", opts)
	vim.keymap.set("n", "<leader>so", require("telescope.builtin").lsp_document_symbols, opts)
	vim.api.nvim_create_user_command("Format", vim.lsp.buf.formatting, {})
	-- lsp_signature initialize
	require("lsp_signature").on_attach() -- Note: add in lsp client on-attach
	-- -- format before saving
	vim.api.nvim_create_autocmd("BufWritePre", {
		desc = "Format buffer before saving",
		callback = function()
			vim.lsp.buf.formatting_sync()
		end,
		buffer = bufnr,
	})
	-- attach aerial
	require("aerial").on_attach(client, bufnr)
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

local lsp_installer = require("nvim-lsp-installer")
lsp_installer.on_server_ready(function(server)
	local opts = {}
	local disable_lsp_formatter_list = { "sumneko_lua", "rust_analyzer", "html" }
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
		-- Integrate rust-tools.nvim
		require("rust-tools").setup({
			-- The "server" property provided in rust-tools setup function are the
			-- settings rust-tools will provide to lspconfig during init.            --
			-- We merge the necessary settings from nvim-lsp-installer (server:get_default_options())
			-- with the user's own settings (opts).
			server = vim.tbl_deep_extend("force", server:get_default_options(), opts),
		})
		server:attach_buffers()
	elseif server.name == "clangd" then
		-- Integrate clangd_extensions.nvim
		require("clangd_extensions").setup({
			server = vim.tbl_deep_extend("force", server:get_default_options(), opts),
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
	else
		if server.name == "sumneko_lua" then
			-- set custom configuration
			opts.settings = {
				Lua = {
					runtime = {
						-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
						version = "LuaJIT",
					},
					diagnostics = {
						-- Get the language server to recognize the `vim` global
						globals = { "vim" },
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
			}
		end
		server:setup(opts)
	end
end)
-- Enable the following language servers manually
local servers = {}
for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
end

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
	-- rust
	null_ls.builtins.formatting.rustfmt,
	-- spellcheck by cspell
	-- null_ls.builtins.diagnostics.cspell,
	-- spellsuggest completion
	-- null_ls.builtins.completion.spell,
}
for _, v in pairs(formatter_predefined) do
	table.insert(formatter_managed, v)
end

-- -- setup
require("null-ls").setup({
	debug = false,
	sources = formatter_managed,
})

-- ╭──────────────────────────────────────────────────────────╮
-- │                    Wrapper Functions                     │
-- ╰──────────────────────────────────────────────────────────╯
local function qf_rename()
	local notify = require("notify")
	local position_params = vim.lsp.util.make_position_params()
	position_params.oldName = vim.fn.expand("<cword>")

	vim.ui.input({ prompt = "Rename To> ", default = position_params.oldName }, function(input)
		if input == nil then
			notify("[lsp] aborted rename", "warn", { render = "minimal" })
			return
		end

		position_params.newName = input
		vim.lsp.buf_request(0, "textDocument/rename", position_params, function(err, result, ...)
			if not result or not result.changes then
				notify(string.format("could not perform rename"), "error", {
					title = string.format("[lsp] rename: %s -> %s", position_params.oldName, position_params.newName),
					timeout = 500,
				})
				return
			end

			vim.lsp.handlers["textDocument/rename"](err, result, ...)

			local notification, entries = "", {}
			local num_files, num_updates = 0, 0
			for uri, edits in pairs(result.changes) do
				num_files = num_files + 1
				local bufnr = vim.uri_to_bufnr(uri)

				for _, edit in ipairs(edits) do
					local start_line = edit.range.start.line + 1
					local line = vim.api.nvim_buf_get_lines(bufnr, start_line - 1, start_line, false)[1]

					num_updates = num_updates + 1
					table.insert(entries, {
						bufnr = bufnr,
						lnum = start_line,
						col = edit.range.start.character + 1,
						text = line,
					})
				end

				local short_uri = string.sub(vim.uri_to_fname(uri), #vim.fn.getcwd() + 2)
				notification = notification .. string.format("made %d change(s) in %s", #edits, short_uri)
			end

			notify(notification, "info", {
				title = string.format("[lsp] rename: %s -> %s", position_params.oldName, position_params.newName),
				timeout = 2500,
			})

			if num_files > 1 then
				require("utils").qf_populate(entries, "r")
			end
		end)
	end)
end
-- vim.lsp.buf.rename = qf_rename
