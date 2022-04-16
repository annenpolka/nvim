local M = {}

function M.config()
	require("incline").setup({
		render = function(props)
			local bufname = vim.api.nvim_buf_get_name(props.buf)
			if bufname == "" then
				return "[No name]"
			else
				bufname = vim.fn.fnamemodify(bufname, ":t")
			end
			return bufname
		end,
		debounce_threshold = { rising = 10, falling = 10 },
		window = {
			width = "fit",
			placement = { horizontal = "right", vertical = "bottom" },
			margin = {
				horizontal = { left = 1, right = 0 },
				vertical = { bottom = 0, top = 1 },
			},
			padding = { left = 1, right = 1 },
			padding_char = " ",
			zindex = 50,
		},
		ignore = {
			floating_wins = true,
			unlisted_buffers = true,
			filetypes = {},
			buftypes = "special",
			wintypes = "special",
		},
		hide = {
			focused_win = false,
		},
	})
end

return M
