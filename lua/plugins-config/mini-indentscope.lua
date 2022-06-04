local M = {}

function M.config()
	require("mini.indentscope").setup({
		draw = {
			delay = 100,
			animation = require("mini.indentscope").gen_animation("quadraticInOut", { duration = 10, unit = "step" }),
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
		-- symbol = "╎",
		symbol = "",
	})

	vim.api.nvim_create_autocmd({ "BufEnter", "BufRead", "BufNewFile" }, {
		pattern = "*",
		callback = function()
			-- Sync highlight color to indent_blankline
			set_highlight("MiniIndentscopeSymbol", { link = "IndentBlanklineContextChar" })
			-- space highlight
			set_highlight("MiniIndentscopePrefix", { link = "PMenu" })
		end,
	})
end

return M
