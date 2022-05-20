local M = {}

function M.config()
	require("incline").setup({
		debounce_threshold = {
			falling = 50,
			rising = 10,
		},
		hide = {
			cursorline = false,
			focused_win = false,
			only_win = false,
		},
		highlight = {
			groups = {
				InclineNormal = {
					default = true,
					group = "NormalFloat",
				},
				InclineNormalNC = {
					default = true,
					group = "NormalFloat",
				},
			},
		},
		ignore = {
			buftypes = "special",
			filetypes = {},
			floating_wins = true,
			unlisted_buffers = true,
			wintypes = "special",
		},
		render = function(props)
			local bufname = vim.api.nvim_buf_get_name(props.buf)
			local icon = require("nvim-web-devicons").get_icon(bufname) or ""
			if bufname == "" then
				return "[No name]"
			else
				bufname = icon .. " " .. vim.fn.fnamemodify(bufname, ":t")
			end
			return bufname
		end,
		window = {
			margin = {
				horizontal = {
					left = 0,
					right = 0,
				},
				vertical = {
					bottom = 0,
					top = 1,
				},
			},
			options = {
				signcolumn = "no",
				wrap = false,
			},
			padding = {
				left = 1,
				right = 1,
			},
			padding_char = " ",
			placement = {
				horizontal = "right",
				vertical = "bottom",
			},
			width = "fit",
			winhighlight = {
				active = {
					EndOfBuffer = "None",
					Normal = "InclineNormal",
					Search = "None",
				},
				inactive = {
					EndOfBuffer = "None",
					Normal = "InclineNormalNC",
					Search = "None",
				},
			},
			zindex = 50,
		},
	})
end

return M
