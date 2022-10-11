local M = {}

function M.config()
	vim.o.winwidth = 5
	vim.o.winminwidth = 5
	vim.o.equalalways = false
	require("windows").setup({
		autowidth = { --		     |windows.autowidth|
			enable = true,
			winwidth = 10, --		      |windows.winwidth|
			filetype = { --	    |windows.autowidth.filetype|
				help = 2,
			},
		},
		ignore = { --			|windows.ignore|
			buftype = { "quickfix", "nofile" },
			filetype = {
				"NvimTree",
				"neo-tree",
				"undotree",
				"gundo",
				"ddu-ff",
				"ddu-ff-filter",
				"harpoon",
				"TelescopePrompt",
			},
		},
		animation = {
			enable = true,
			duration = 150,
			fps = 60,
			easing = "in_out_sine",
		},
	})
end

function M.map()
	vim.keymap.set("n", "<CR>", "<Cmd>WindowsMaximize<CR>")
end

return M
