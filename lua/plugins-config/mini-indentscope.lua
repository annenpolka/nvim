local M = {}

function M.config()
	require("mini.indentscope").setup({
		draw = {
			delay = 100,
			animation = require("mini.indentscope").gen_animation("quadraticOut", { duration = 5, unit = "step" }),
			-- animation = require("mini.indentscope").gen_animation("none"),
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
			indent_at_cursor = false,
			try_as_border = true,
		},
		symbol = "╎",
		-- symbol = "",
	})

	--- highlight
	local h = function(...)
		vim.api.nvim_set_hl(0, ...)
	end
	-- Sync highlight color to indent_blankline
	h("MiniIndentscopeSymbol", { link = "IndentBlanklineContextChar" })
	-- space highlight
	-- h("MiniIndentscopePrefix", { link = "PMenuSel" })
end

return M
