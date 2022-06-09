local M = {}

function M.config()
	require("neotest").setup({
		adapters = {
			require("neotest-python")({
				dap = { justMyCode = false },
			}),
			require("neotest-plenary"),
			require("neotest-vim-test")({
				ignore_file_types = { "python", "vim", "lua" },
			}),
		},
		diagnostic = {
			enabled = true,
		},
		floating = {
			border = "rounded",
			max_height = 0.6,
			max_width = 0.6,
		},
		highlights = {
			adapter_name = "NeotestAdapterName",
			border = "NeotestBorder",
			dir = "NeotestDir",
			expand_marker = "NeotestExpandMarker",
			failed = "NeotestFailed",
			file = "NeotestFile",
			focused = "NeotestFocused",
			indent = "NeotestIndent",
			namespace = "NeotestNamespace",
			passed = "NeotestPassed",
			running = "NeotestRunning",
			skipped = "NeotestSkipped",
			test = "NeotestTest",
		},
		icons = {
			child_indent = "│",
			child_prefix = "├",
			collapsed = "─",
			expanded = "╮",
			failed = "✖",
			final_child_indent = " ",
			final_child_prefix = "╰",
			non_collapsible = "─",
			passed = "✔",
			running = "🗘",
			skipped = "ﰸ",
			unknown = "?",
		},
		output = {
			enabled = true,
			open_on_run = "short",
		},
		run = {
			enabled = true,
		},
		status = {
			enabled = true,
		},
		strategies = {
			integrated = {
				height = 40,
				width = 120,
			},
		},
		summary = {
			enabled = true,
			expand_errors = true,
			follow = true,
			mappings = {
				attach = "a",
				expand = { "<CR>", "<2-LeftMouse>" },
				expand_all = "e",
				jumpto = "i",
				output = "o",
				run = "r",
				short = "O",
				stop = "u",
			},
		},
	})
end

function M.map()
	local command = vim.api.nvim_create_user_command
	command("NeotestRunNearest", function()
		require("neotest").run.run()
	end, { nargs = 0 })
	command("NeotestRunCurrentFile", function()
		require("neotest").run.run(vim.fn.expand("%"))
	end, { nargs = 0 })
	command("NeotestStop", function()
		require("neotest").run.stop()
	end, { nargs = 0 })
	command("NeotestAttach", function()
		require("neotest").run.attach()
	end, { nargs = 0 })
	command("NeotestSummary", function()
		require("neotest").summary.toggle()
	end, { nargs = 0 })
	command("NeotestOutput", function()
		require("neotest").output.open()
	end, { nargs = 0 })
end

return M
