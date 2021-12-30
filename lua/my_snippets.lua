-- My Snippets for LuaSnip

-- needed members
local ls = require'luasnip'
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
    s({trig = 'trigger'}, {
        -- そのまま挿入される
        t({"hello !"}),
        i(0)
    })
  }
}
