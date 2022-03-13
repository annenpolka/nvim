local M = {}

function M.config()
	local cmp = require("cmp")
	local cmp_buffer = require("cmp_buffer")
	local luasnip = require("luasnip")
	local lspkind = require("lspkind")

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
			{
				name = "buffer",
				option = {
					keyword_pattern = [[\k\+]],
					get_bufnrs = function()
						return vim.api.nvim_list_bufs()
					end,
				},
			},
			{ name = "path" },
			{ name = "luasnip" },
			{ name = "treesitter" },
			{ name = "copilot" },
			{ name = "rg", option = { additional_arguments = "--smart-case --max-depth 2" } },
		},
		formatting = {
			-- devicons by lspkind
			format = lspkind.cmp_format({
				with_text = true, -- do not show text alongside icons
				maxwidth = 50,
				menu = {
					buffer = "[Buf]",
					nvim_lsp = "[LSP]",
					look = "[Look]",
					luasnip = "[LuaSnip]",
					rg = "[rg]",
				},
			}),
			-- avoid duplicates
			function(entry, vim_item)
				vim_item.dup = ({
					buffer = 0,
					path = 1,
					nvim_lsp = 0,
				})[entry.source.name] or 0
				return vim_item
			end,
		},

		sorting = {
			comparators = {
				function(...)
					return cmp_buffer:compare_locality(...)
				end,
				cmp.config.compare.offset,
				cmp.config.compare.exact,
				cmp.config.compare.score,
				require("cmp-under-comparator").under,
				cmp.config.compare.kind,
				cmp.config.compare.sort_text,
				cmp.config.compare.length,
				cmp.config.compare.order,
				-- The rest of your comparators...
			},
		},
	})

	-- cmdline completion
	require("cmp").setup.cmdline(":", {
		sources = {
			{ name = "cmdline" },
		},
	})
	-- search completion
	require("cmp").setup.cmdline("/", {
		sources = {
			{ name = "nvim_lsp_document_symbol" },
			{ name = "buffer" },
		},
	})

	-- autopairs integration
	local cmp_autopairs = require("nvim-autopairs.completion.cmp")
	cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))
end

return M
