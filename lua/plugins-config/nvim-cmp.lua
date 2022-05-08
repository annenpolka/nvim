local M = {}

function M.config()
	local cmp = require("cmp")
	local types = require("cmp.types")
	local str = require("cmp.utils.str")
	local cmp_buffer = require("cmp_buffer")
	local luasnip = require("luasnip")
	local lspkind = require("lspkind")
	require("snippets") -- load snippets

	cmp.setup({
		snippet = {
			expand = function(args)
				luasnip.lsp_expand(args.body)
			end,
		},
		window = {
			-- completion = cmp.config.window.bordered(),
			documentation = cmp.config.window.bordered(),
		},
		mapping = {
			["<C-p>"] = cmp.mapping.select_prev_item(),
			["<C-n>"] = cmp.mapping.select_next_item(),
			["<C-d>"] = cmp.mapping.scroll_docs(-4),
			["<C-f>"] = cmp.mapping.scroll_docs(4),
			["<C-l>"] = cmp.mapping.complete(),
			["<C-e>"] = cmp.mapping.close(),
			["<C-j>"] = cmp.mapping.confirm({
				behavior = cmp.ConfirmBehavior.Replace,
				select = true,
			}),
			["<CR>"] = cmp.mapping.confirm({
				behavior = cmp.ConfirmBehavior.Replace,
				select = true,
			}),
			["<C-k>"] = function(fallback)
				if luasnip.expand_or_jumpable() then
					luasnip.expand_or_jump()
				else
					fallback()
				end
			end,
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
			{
				name = "nvim_lsp",
				max_item_count = 30,
			},
			{
				name = "buffer",
				max_item_count = 10,
				indexing_interval = 500,
				indexing_batch_size = 1500,
				option = {
					keyword_pattern = [[\k\+]], -- isKeyword
					get_bufnrs = function() -- all buffers
						return vim.api.nvim_list_bufs()
					end,
				},
			},
			{ name = "path" },
			{
				name = "luasnip",
				priority = 10,
			},
			{ name = "nvim_lua" },
			{
				name = "treesitter",
				max_item_count = 10,
			},
			{
				name = "copilot",
				priority = 1000,
			},
			{
				name = "rg",
				max_item_count = 5,
				keyword_length = 3,
				priority = -1,
				option = { additional_arguments = "--smart-case --max-depth 3" },
			},
			{
				name = "look",
				keyword_length = 2,
				max_item_count = 5,
				priority = -3,
				option = {
					convert_case = true,
					loud = true,
					--dict = '/usr/share/dict/words'
				},
			},
		},
		formatting = {
			-- devicons by lspkind
			format = lspkind.cmp_format({
				mode = "symbol_text",
				maxwidth = 50,
				-- preset = "codicons",

				before = function(entry, vim_item)
					-- avoid duplicates
					vim_item.dup = ({
						buffer = 0,
						path = 1,
						nvim_lsp = 0,
					})[entry.source.name] or 0

					-- Get the full snippet (and only keep first line)
					local word = entry:get_insert_text()
					if entry.completion_item.insertTextFormat == types.lsp.InsertTextFormat.Snippet then
						word = vim.lsp.util.parse_snippet(word)
					end
					word = str.oneline(word)
					if
						entry.completion_item.insertTextFormat == types.lsp.InsertTextFormat.Snippet
						and string.sub(vim_item.abbr, -1, -1) == "~"
					then
						word = word .. "~"
					end
					vim_item.abbr = word

					return vim_item
				end,
				menu = {
					buffer = "[Buf]",
					nvim_lsp = "[LSP]",
					look = "[Look]",
					luasnip = "[LuaSnip]",
					nvim_lua = "[Neovim]",
					rg = "[rg]",
					path = "[path]",
					treesitter = "[TS]",
					copilot = "[Copilot]",
				},
			}),
		},

		sorting = {
			comparators = {
				function(...)
					return cmp_buffer:compare_locality(...)
				end,
				cmp.config.compare.recently_used,
				cmp.config.compare.score,
				cmp.config.compare.offset,
				-- cmp.config.compare.locality,
				cmp.config.compare.exact,
				require("cmp-under-comparator").under,
				cmp.config.compare.kind,
				cmp.config.compare.sort_text,
				cmp.config.compare.length,
				cmp.config.compare.order,
				-- The rest of your comparators...
			},
		},
		experimental = {
			ghost_text = true,
		},
	})
	-- cmdline completion
	require("cmp").setup.cmdline(":", {
		sources = {
			{ name = "cmdline" },
		},
		mapping = cmp.mapping.preset.cmdline({
			["<C-p>"] = function(fallback)
				fallback()
			end,
			["<C-n>"] = function(fallback)
				fallback()
			end,
		}),
	})

	-- search completion
	require("cmp").setup.cmdline("/", {
		sources = {
			{ name = "nvim_lsp_document_symbol" },
			{ name = "buffer" },
		},
		mapping = cmp.mapping.preset.cmdline({}),
	})

	-- autopairs integration
	local cmp_autopairs = require("nvim-autopairs.completion.cmp")
	cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))
end

return M
