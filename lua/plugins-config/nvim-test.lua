local M = {}

function M.config()
	require("nvim-test").setup({
		commands_create = true, -- create commands (TestFile, TestLast, ...)
		silent = false, -- less notifications
		run = true, -- run test commands
		term = "terminal", -- a terminal to run (terminal|toggleterm)
		termOpts = {
			direction = "vertical", -- terminal's direction (horizontal|vertical|float)
			width = 96, -- terminal's width (for vertical|float)
			height = 24, -- terminal's height (for horizontal|float)
			go_back = false, -- return focus to original window after executing
			stopinsert = false, -- exit from insert mode
		},
		runners = { -- setup tests runners
			go = "nvim-test.runners.go-test",
			javascript = "nvim-test.runners.jest",
			lua = "nvim-test.runners.busted",
			python = "nvim-test.runners.pytest",
			rust = "nvim-test.runners.cargo-test",
			typescript = "nvim-test.runners.jest",
		},
	})
end

return M
