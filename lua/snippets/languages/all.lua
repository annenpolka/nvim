-- needed members
local ls = require("luasnip")
local s = ls.s
local sn = ls.sn
local t = ls.t
local i = ls.i
local f = ls.f
local c = ls.c
local d = ls.d

-- -- autosnippets
ls.add_snippets(
	"all",
	-- get current file name
	{
		ls.parser.parse_snippet("$file$", "$TM_FILENAME"),
	},
	-- set above ones as autosnippets
	{
		type = "autosnippets",
		key = "all_auto",
	}
)
