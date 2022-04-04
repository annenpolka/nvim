-- My Snippets for LuaSnip

-- needed members
local ls = require("luasnip")
local s = ls.s
local sn = ls.sn
local t = ls.t
local i = ls.i
local f = ls.f
local c = ls.c
local d = ls.d

-- snippet definitions
ls.snippets = {
	all = {
		-- s({ trig = "triggerhogehogehoge" }, {
		-- 	-- -- そのまま挿入される
		-- 	-- t({ "hello !" }),
		-- 	-- i(0),
		-- }),
	},
	cpp = {
		-- rep macro
		s({ trig = "rep" }, {
			t({ "#define rep(i, n) for (int i = 0; i < (int)(n); i++)" }),
			i(2),
		}),
	},
}

-- load frinedly-snippets
require("luasnip.loaders.from_vscode").lazy_load()
