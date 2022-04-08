-- ╭──────────────────────────────────────────────────────────╮
-- │                  LuaSnip configuration                   │
-- ╰──────────────────────────────────────────────────────────╯
-- needed members
local ls = require("luasnip")
local s = ls.s
local sn = ls.sn
local t = ls.t
local i = ls.i
local f = ls.f
local c = ls.c
local d = ls.d
local types = require("luasnip.util.types")

ls.config.set_config({
	history = true,
	-- Update more often, :h events for more info.
	update_events = "TextChanged,TextChangedI",
	-- Snippets aren't automatically removed if their text is deleted.
	-- `delete_check_events` determines on which events (:h events) a check for
	-- deleted snippets is performed.
	-- This can be especially useful when `history` is enabled.
	delete_check_events = "TextChanged",
	-- ext_opts = {
	-- 	[types.choiceNode] = {
	-- 		active = {
	-- 			virt_text = { { "● ", "Type" } },
	-- 		},
	-- 	},
	-- 	[types.insertNode] = {
	-- 		active = {
	-- 			virt_text = { { "● ", "NonText" } },
	-- 		},
	-- 	},
	-- },
	-- treesitter-hl has 100, use something higher (default is 200).
	ext_base_prio = 300,
	-- minimal increase in priority.
	ext_prio_increase = 1,
	enable_autosnippets = true,
	-- mapping for cutting selected text so it's usable as SELECT_DEDENT,
	-- SELECT_RAW or TM_SELECTED_TEXT (mapped via xmap).
	store_selection_keys = "<Tab>",
	-- luasnip uses this function to get the currently active filetype. This
	-- is the (rather uninteresting) default, but it's possible to use
	-- eg. treesitter for getting the current filetype by setting ft_func to
	-- require("luasnip.extras.filetype_functions").from_cursor (requires
	-- `nvim-treesitter/nvim-treesitter`). This allows correctly resolving
	-- the current filetype in eg. a markdown-code block or `vim.cmd()`.
	ft_func = require("luasnip.extras.filetype_functions").from_cursor,
})

-- ╭──────────────────────────────────────────────────────────╮
-- │                   snippet definitions                    │
-- ╰──────────────────────────────────────────────────────────╯
-- load snippets for each language
for _, ft_path in ipairs(vim.api.nvim_get_runtime_file("lua/snippets/languages/*.lua", true)) do
	local ft = vim.fn.fnamemodify(ft_path, ":t:r")
	require("snippets.languages." .. ft)
end

-- load friendly-snippets
require("luasnip.loaders.from_vscode").lazy_load()
