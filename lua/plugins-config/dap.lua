local M = {}

function M.config()
	-- ╭──────────────────────────────────────────────────────────╮
	-- │                            dap                           │
	-- ╰──────────────────────────────────────────────────────────╯
	local dap = require("dap")
	local dapui = require("dapui")
	-- load each language settings in nvim/lua/dbg/
	require("dbg")
	-- initialize dap-ui
	dapui.setup()
	-- auto open dap-ui
	dap.listeners.after.event_initialized["dapui_config"] = function()
		dapui.open()
	end

	-- dap virtual text annotation
	require("nvim-dap-virtual-text").setup({
		enabled = true,
		enabled_commands = true,
		highlight_changed_variables = true,
	})
	-- ╭──────────────────────────────────────────────────────────╮
	-- │                        asynctasks                        │
	-- ╰──────────────────────────────────────────────────────────╯
	-- open quickfix automatically
	-- vim.g.asyncrun_open = 6

	-- execute compile task on save
	vim.api.nvim_command([[autocmd BufWritePost * silent! AsyncTask file-build]])
end

function M.map()
	nnoremap("<F5>", ":lua require'dap'.continue()<CR>", { silent = true })
	nnoremap("<F10>", ":lua require'dap'.step_over()<CR>", { silent = true })
	nnoremap("<F11>", ":lua require'dap'.step_into()<CR>", { silent = true })
	nnoremap("<F12>", ":lua require'dap'.step_out()<CR>", { silent = true })
	nnoremap("<F9>", ":lua require'dap'.toggle_breakpoint()<CR>", { silent = true })
	nnoremap(
		"<leader>B",
		":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
		{ silent = true }
	)
	-- nnoremap(
	-- 	"<leader>lp",
	-- 	":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>",
	-- 	{ silent = true }
	-- )
	nnoremap("<leader>dr", ":lua require'dap'.repl.open()<CR>", { silent = true })
	nnoremap("<leader>dl", ":lua require'dap'.run_last()<CR>", { silent = true })
	nnoremap("<leader>dd", ":lua require'dapui'.toggle()<CR>", { silent = true })
end

return M
