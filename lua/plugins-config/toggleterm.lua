local M = {}
function M.map()
	vim.keymap.set("n", "<leader>Gg", "<cmd>lua _lazygit_toggle()<CR>", { noremap = true, silent = true })
end

function M.config()
	require("toggleterm").setup({
		open_mapping = [[<c-Space>]],
		direction = "float",
	})
	-- lazygit terminal
	local Terminal = require("toggleterm.terminal").Terminal
	local lazygit = Terminal:new({
		cmd = "lazygit",
		dir = "git_dir",
		direction = "float",
		float_opts = {
			border = "double",
		},
		-- function to run on opening the terminal
		on_open = function(term)
			vim.cmd("startinsert!")
			vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
		end,
		-- function to run on closing the terminal
		---@diagnostic disable-next-line: unused-local
		on_close = function(term)
			-- vim.cmd("Closing terminal")
		end,
	})

	---@diagnostic disable-next-line: lowercase-global
	function _lazygit_toggle()
		lazygit:toggle()
	end
end

return M
