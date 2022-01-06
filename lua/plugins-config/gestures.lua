local M = {}

function M.config()
	local gesture = require("gesture")
	gesture.register({
		name = "vertical split",
		inputs = { gesture.down() },
		action = "vs",
	})
	gesture.register({
		name = "horizontal split",
		inputs = { gesture.right() },
		action = "sp",
	})
end

function M.map()
	-- mouse gestures configuration
	vim.api.nvim_set_keymap(
		"n",
		"<LeftDrag>",
		[[<Cmd>lua require('gesture').draw()<CR>]],
		{ noremap = true, silent = true }
	)
	vim.api.nvim_set_keymap(
		"n",
		"<LeftRelease>",
		[[<Cmd>lua require('gesture').finish()<CR>]],
		{ noremap = true, silent = true }
	)
end

return M
