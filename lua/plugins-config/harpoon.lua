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
		menu = {
			width = vim.api.nvim_win_get_width(0) - 20,
		},
	})
	require("telescope").load_extension("harpoon")
end

function M.map()
	vim.keymap.set(
		"n",
		"<leader>m",
		":lua require('harpoon.mark').toggle_file()<CR>",
		{ noremap = true, silent = true }
	)
	vim.keymap.set(
		"n",
		"<leader>M",
		":lua require('harpoon.ui').toggle_quick_menu()<CR>",
		{ noremap = true, silent = true }
	)
	vim.keymap.set("n", "m", ":lua require('harpoon.ui').nav_next()<CR>", { noremap = true, silent = true })
	vim.keymap.set("n", "M", ":lua require('harpoon.ui').nav_prev()<CR>", { noremap = true, silent = true })
	for i = 1, 9 do
		nnoremap("g" .. i, ":lua require('harpoon.ui').nav_file(" .. i .. ")<CR>", { silent = true })
	end
	-- ╰──────────────────────────────────────────────────────────╯
	-- append current buffer parent path
	local function get_active_buffer_path()
		return vim.fn.fnamemodify(vim.fn.expand("#:p:h"), ":~:.") .. "/"
	end
	local function append_to_buffer_last_line(text)
		vim.cmd("normal Go" .. text)
	end
	nnoremap("<C-n>", function()
		append_to_buffer_last_line(get_active_buffer_path())
		vim.api.nvim_feedkeys("A", "n", true)
	end, { ft = "harpoon" })
end

return M
