local M = {}

function M.config()
	require("noice").setup({
		cmdline = {
			view = "cmdline_popup", -- view for rendering the cmdline. Change to `cmdline` to get a classic cmdline at the bottom
			opts = { buf_options = { filetype = "vim" } }, -- enable syntax highlighting in the cmdline
			icons = {
				["/"] = { icon = " ", hl_group = "DiagnosticWarn" },
				["?"] = { icon = " ", hl_group = "DiagnosticWarn" },
				[":"] = { icon = " ", hl_group = "DiagnosticInfo", firstc = false },
			},
		},
		history = {
			-- options for the message history that you get with `:Noice`
			view = "split",
			opts = { enter = true },
			filter = { event = "msg_show", ["not"] = { kind = { "search_count", "echo" } } },
		},
		views = {
			cmdline_popup = {
				position = {
					row = 5,
					col = "50%",
				},
				size = {
					width = 60,
					height = "auto",
				},
			},
			popupmenu = {
				relative = "editor",
				position = {
					row = 8,
					col = "50%",
				},
				size = {
					width = 60,
					height = 10,
				},
				border = {
					style = "rounded",
					padding = { 0, 1 },
				},
				win_options = {
					winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
				},
			},
		},
		routes = {
			{
				filter = {
					event = "msg_show",
					kind = "",
					find = "written",
				},
				opts = { skip = true },
			},
		},
	})
	vim.keymap.set({ "c" }, "<C-g>", "<C-u><Esc>", { noremap = true })
end

return M
