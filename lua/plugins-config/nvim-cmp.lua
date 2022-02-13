local M = {}

function M.config()
	-- luasnip setup
	local luasnip = require("luasnip")
	local snippets = require("my_snippets")
	local lspkind = require("lspkind")

	-- nvim-cmp setup
	local cmp = require("cmp")
	local cmp_buffer = require("cmp_buffer")
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
			{ name = "look", keyword_length = 3, option = { convert_case = true, loud = true } },
			{ name = "path" },
			{ name = "luasnip" },
			{ name = "rg", option = { additional_arguments = "--smart-case --max-depth 2" } },
			{ name = "treesitter" },
			-- { name = "cmp_tabnine" },
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
	})

	-- If you want insert `(` after select function or method item
	local cmp_autopairs = require("nvim-autopairs.completion.cmp")
	cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))

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

	-- cmp-tabnine config
	-- 	local tabnine = require("cmp_tabnine.config")
	-- 	tabnine:setup({
	-- 		max_lines = 1000,
	-- 		max_num_results = 20,
	-- 		sort = true,
	-- 		run_on_every_keystroke = true,
	-- 		snippet_placeholder = "..",
	-- 		ignored_file_types = { -- default is not to ignore
	-- 			-- uncomment to ignore in lua:
	-- 			-- lua = true
	-- 		},
	-- 	})
end

return M
