local M = {}

function M.config()
	-- -- options
	vim.g.nvim_tree_quit_on_open = 1
	local tree_cb = require("nvim-tree.config").nvim_tree_callback
	local nvimtree_config = {
		disable_netrw = true,
		hijack_netrw = true,
		open_on_setup = true,
		ignore_ft_on_setup = {},
		auto_close = false,
		open_on_tab = false,
		hijack_cursor = true,
		update_cwd = true,
		update_to_buf_dir = {
			enable = true,
			auto_open = true,
		},
		diagnostics = {
			enable = false,
			icons = {
				hint = "",
				info = "",
				warning = "",
				error = "",
			},
		},
		update_focused_file = {
			enable = true,
			update_cwd = true,
			ignore_list = {},
		},
		system_open = {
			cmd = nil,
			args = {},
		},
		filters = {
			dotfiles = false,
			custom = {},
		},
		git = {
			enable = true,
			ignore = true,
			timeout = 500,
		},
		view = {
			width = 30,
			height = 30,
			hide_root_folder = false,
			side = "left",
			auto_resize = false,
			-- keybindings inside nvimtree
			mappings = {
				custom_only = false,
				list = {
					{ key = { "<CR>", "o", "<2-LeftMouse>" }, cb = tree_cb("edit") },
					{ key = { "l" }, cb = tree_cb("edit") },
					{ key = { "h" }, cb = tree_cb("close_node") },
				},
			},
			number = false,
			relativenumber = false,
			signcolumn = "yes",
		},
		trash = {
			cmd = "trash",
			require_confirm = true,
		},
	}
	require("nvim-tree").setup(nvimtree_config)
end

function M.map()
	-- vim.api.nvim_set_keymap("n", "<c-e>", "<cmd>NvimTreeToggle<CR>", { noremap = true, silent = true })
end

return M
