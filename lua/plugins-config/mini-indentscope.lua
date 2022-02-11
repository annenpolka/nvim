local M = {}

function M.config()
	require("mini.indentscope").setup({
		draw = {
			delay = 100,
			animation = require("mini.indentscope").gen_animation("quadraticOut", { duration = 10, unit = "step" }),
		},
		-- Module mappings. Use `''` (empty string) to disable one.
		mappings = {
			-- Textobjects
			object_scope = "ii",
			object_scope_with_border = "ai",

			-- Motions (jump to respective border line; if not present - body line)
			goto_top = "[i",
			goto_bottom = "]i",
		},
		options = {
			border = "both",
		},
	})
end

return M
