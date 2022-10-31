local M = {}

function M.config()
	local spec_treesitter = require("mini.ai").gen_spec.treesitter
	local gen_spec = require("mini.ai").gen_spec
	require("mini.ai").setup({
		-- Table with textobject id as fields, textobject specification as values.
		-- Also use this to disable builtin textobjects. See |MiniAi.config|.
		custom_textobjects = {
			f = spec_treesitter({ a = "@function.outer", i = "@function.inner" }),
			a = spec_treesitter({
				a = { "@parameter.outer", "@field.outer" },
				i = { "@parameter.inner", "@field.inner" },
			}),
			-- x = spec_treesitter({ a = "@swappable", i = "@swappable" }),
			c = gen_spec.function_call({ name_pattern = "[%w_]" }),
			s = { { "%b()", "%b[]", "%b{}", "%b''", '%b""' }, "^.().*().$" },
		},

		-- Module mappings. Use `''` (empty string) to disable one.
		mappings = {
			-- Main textobject prefixes
			around = "a",
			inside = "i",

			-- Move cursor to certain edge of `a` textobject
			goto_left = "g[",
			goto_right = "g]",
		},

		-- Number of lines within which textobject is searched
		n_lines = 50,

		-- How to search for object (first inside current line, then inside
		-- neighborhood). One of 'cover', 'cover_or_next', 'cover_or_prev',
		-- 'cover_or_nearest'.
		search_method = "cover_or_next",
	})
end

return M
