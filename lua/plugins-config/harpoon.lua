local M = {}

function M.config()
	require("harpoon").setup({
		global_settings = {
			-- sets the marks upon calling `toggle` on the ui, instead of require `:w`.
			save_on_toggle = false,

			-- saves the harpoon file upon every change. disabling is unrecommended.
			save_on_change = true,

			-- sets harpoon to run the command immediately as it's passed to the terminal when calling `sendCommand`.
			enter_on_sendcmd = false,

			-- closes any tmux windows harpoon that harpoon creates when you close Neovim.
			tmux_autoclose_windows = false,

			-- filetypes that you want to prevent from adding to the harpoon list menu.
			excluded_filetypes = { "harpoon" },
		},
	})
end

function M.map()
	vim.api.nvim_set_keymap(
		"n",
		"mm",
		":lua require('harpoon.mark').toggle_file()<CR>",
		{ noremap = true, silent = true }
	)
	vim.api.nvim_set_keymap(
		"n",
		"M",
		":lua require('harpoon.ui').toggle_quick_menu()<CR>",
		{ noremap = true, silent = true }
	)
	vim.api.nvim_set_keymap(
		"n",
		"<leader><Space>",
		":lua require('harpoon.ui').nav_next()<CR>",
		{ noremap = true, silent = true }
	)
	vim.api.nvim_set_keymap(
		"n",
		"<leader>m",
		":lua require('harpoon.ui').nav_prev()<CR>",
		{ noremap = true, silent = true }
	)
end

return M
