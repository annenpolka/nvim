local M = {}

function M.config()
	require("yanky").setup({
		{
			ring = {
				history_length = 10,
				storage = "shada",
				sync_with_numbered_registers = true,
			},
			system_clipboard = {
				sync_with_ring = true,
			},
			highlight = {
				on_put = true,
				on_yank = true,
				timer = 1000,
			},
			preserve_cursor_position = {
				enabled = true,
			},
		},
	})
end

function M.map()
	vim.keymap.set("n", "p", "<Plug>(YankyPutAfter)", {})
	vim.keymap.set("n", "P", "<Plug>(YankyPutBefore)", {})
	vim.keymap.set("x", "p", "<Plug>(YankyPutAfter)", {})
	vim.keymap.set("x", "P", "<Plug>(YankyPutBefore)", {})
	vim.keymap.set("n", "gp", "<Plug>(YankyGPutAfter)", {})
	vim.keymap.set("n", "gP", "<Plug>(YankyGPutBefore)", {})
	vim.keymap.set("x", "gp", "<Plug>(YankyGPutAfter)", {})
	vim.keymap.set("x", "gP", "<Plug>(YankyGPutBefore)", {})
	-- cycle key
	vim.keymap.set("n", "<A-j>", "<Plug>(YankyCycleForward)", {})
	vim.keymap.set("n", "<A-k>", "<Plug>(YankyCycleBackward)", {})
end

return M
