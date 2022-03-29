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
	vim.keymap.set("n", "<RightMouse>", [[<Nop>]], { noremap = true, silent = true })
	vim.keymap.set(
		"n",
		"<RightDrag>",
		[[<Cmd>lua require('gesture').draw()<CR>]],
		{ noremap = true, silent = true }
	)
	vim.keymap.set(
		"n",
		"<RightRelease>",
		[[<Cmd>lua require('gesture').finish()<CR>]],
		{ noremap = true, silent = true }
	)
end

return M
