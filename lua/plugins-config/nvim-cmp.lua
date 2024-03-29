local M = {}

local icons = {
	Text = "",
	Method = "",
	Function = "",
	Constructor = "⌘",
	Field = "ﰠ",
	Variable = "",
	Class = "ﴯ",
	Interface = "",
	Module = "",
	Property = "ﰠ",
	Unit = "塞",
	Value = "",
	Enum = "",
	Keyword = "廓",
	Snippet = "",
	Color = "",
	File = "",
	Reference = "",
	Folder = "",
	EnumMember = "",
	Constant = "",
	Struct = "פּ",
	Event = "",
	Operator = "",
	TypeParameter = "",
}

function M.config()
	local cmp = require("cmp")
	local types = require("cmp.types")
	local str = require("cmp.utils.str")
	local cmp_buffer = require("cmp_buffer")
	local luasnip = require("luasnip")
	require("snippets") -- load snippets

	cmp.setup({
		enabled = function()
			-- disable nvim-cmp on specific filetypes
			local is_enabled = true
			local filetype = vim.api.nvim_buf_get_option(0, "filetype")
			local ignored_filetypes = { "OverseerForm" }
			for _, ignored in ipairs(ignored_filetypes) do
				if filetype == ignored then
					is_enabled = false
				end
			end

			-- disable nvim-cmp on specific buftypes
			local buftype = vim.api.nvim_buf_get_option(0, "buftype")
			local ignored_buftypes = { "prompt" }
			for _, ignored in ipairs(ignored_buftypes) do
				if buftype == ignored then
					is_enabled = false
				end
			end

			return is_enabled
		end,
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
			["<C-k>"] = cmp.mapping(function(fallback)
				if luasnip.expand_or_jumpable() then
					luasnip.expand_or_jump()
				else
					fallback()
				end
			end, { "i", "s" }),
			["<Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_next_item()
				elseif luasnip.expand_or_jumpable() then
					luasnip.expand_or_jump()
				else
					fallback()
				end
			end, { "i", "s" }),
			["<S-Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_prev_item()
				elseif luasnip.jumpable(-1) then
					luasnip.jump(-1)
				else
					fallback()
				end
			end, { "i", "s" }),
		},
		sources = {
			{
				name = "nvim_lsp",
				max_item_count = 30,
				priority = 10,
			},
			{
				name = "buffer",
				max_item_count = 10,
				priority = -1,
				indexing_interval = 500,
				indexing_batch_size = 1500,
				option = {
					keyword_pattern = [[\k\+]], -- iskeyword
					get_bufnrs = function() -- all buffers
						return vim.api.nvim_list_bufs()
					end,
				},
			},
			{ name = "path" },
			{
				name = "luasnip",
				priority = 20,
			},
			{ name = "nvim_lua" },
			{
				name = "treesitter",
				priority = -1,
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
				priority = -2,
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
		completion = {
			completeopt = "menu,menuone,noinsert,noselect",
			keyword_pattern = [[\%(-\?\d\+\%(\.\d\+\)\?\|\h\w*\%(-\w*\)*\)]],
			keyword_length = 1,
		},
		formatting = {
			fields = { "kind", "abbr", "menu" },
			format = function(entry, vim_item)
				-- return type if available, otherwise return item kind
				local function get_kind()
					local item = entry:get_completion_item()
					if item.detail then
						return item.detail
					else
						return vim_item.kind
					end
				end
				-- menu formatting with `kind` and `source name`
				vim_item.menu = string.format(
					"%s %s",
					-- item kind text
					get_kind(),
					-- source name
					({
						buffer = "[Buf]",
						nvim_lsp = "[LSP]",
						look = "[Look]",
						luasnip = "[LuaSnip]",
						nvim_lua = "[neovim]",
						rg = "[rg]",
						path = "[path]",
						treesitter = "[TS]",
						copilot = "[Cop]",
					})[entry.source.name] or ""
				)

				-- show icon as kind
				vim_item.kind = icons[vim_item.kind]

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

				-- avoid duplicates
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
				cmp.config.compare.recently_used,
				cmp.config.compare.score,
				cmp.config.compare.offset,
				function(...)
					return cmp_buffer:compare_locality(...)
				end,
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
