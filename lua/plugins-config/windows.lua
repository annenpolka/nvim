local M = {}

function M.config()
	vim.o.winwidth = 5
	vim.o.winminwidth = 5
	vim.o.equalalways = false
	require("windows").setup({
		autowidth = { --		     |windows.autowidth|
			enable = true,
			winwidth = 5, --		      |windows.winwidth|
			filetype = { --	    |windows.autowidth.filetype|
				help = 2,
			},
		},
		ignore = { --			|windows.ignore|
			buftype = { "quickfix" },
			filetype = { "NvimTree", "neo-tree", "undotree", "gundo", "ddu-ff", "ddu-ff-filter", "harpoon" },
		},
		animation = {
			enable = true,
			duration = 200,
			fps = 30,
			easing = "in_out_sine",
		},
	})
end

return M
