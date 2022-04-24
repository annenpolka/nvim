local M = {}

function M.config()
	local mapping = require("yanky.telescope.mapping")
	require("yanky").setup({
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
			timer = 400,
		},
		preserve_cursor_position = {
			enabled = true,
		},
		picker = {
			telescope = {
				mappings = {
					default = mapping.put("p"),
					i = {
						-- ["<c-p>"] = mapping.put("p"),
						-- ["<c-k>"] = mapping.put("P"),
					},
					n = {
						["p"] = mapping.put("p"),
						["P"] = mapping.put("P"),
					},
				},
			},
		},
	})
	-- integrate with telescope
	require("telescope").load_extension("yank_history")
end

function M.map()
	vim.keymap.set("n", "y", "<Plug>(YankyYank)", {})
	vim.keymap.set("x", "y", "<Plug>(YankyYank)", {})
	vim.keymap.set("n", "p", "<Plug>(YankyPutAfter)", {})
	vim.keymap.set("n", "P", "<Plug>(YankyPutBefore)", {})
	vim.keymap.set("x", "p", "<Plug>(YankyPutAfter)", {})
	vim.keymap.set("x", "P", "<Plug>(YankyPutBefore)", {})
	-- vim.keymap.set("n", "gp", "<Plug>(YankyGPutAfter)", {})
	-- vim.keymap.set("n", "gP", "<Plug>(YankyGPutBefore)", {})
	-- vim.keymap.set("x", "gp", "<Plug>(YankyGPutAfter)", {})
	-- vim.keymap.set("x", "gP", "<Plug>(YankyGPutBefore)", {})

	-- cycle key
	vim.keymap.set("n", "gn", "<Plug>(YankyCycleForward)", {})
	vim.keymap.set("n", "gp", "<Plug>(YankyCycleBackward)", {})
	-- open yank_history with telescope
	vim.keymap.set("n", "R", "<Cmd>Telescope yank_history<CR>", {})
end

return M
