local ls = require("luasnip")
local s = ls.s
local sn = ls.sn
local t = ls.t
local i = ls.i
local f = ls.f
local c = ls.c
local d = ls.d

ls.add_snippets(nil, {
	cpp = {
		-- rep macro
		s({ trig = "#rep" }, {
			t({ "#define rep(i, n) for (int i = 0; i < (int)(n); i++)" }),
			i(2),
		}),
	},
})
