local M = {}

function M.config()
	require("qf_helper").setup({
		sort_lsp_diagnostics = true, -- Sort LSP diagnostic results
		quickfix = {
			autoclose = false, -- Autoclose qf if it's the only open window
		},
		loclist = { -- The same options, but for the loclist
			autoclose = false,
		},
	})
end

function M.map()
	vim.api.nvim_set_keymap("n", "gq", ":QNext<CR>", { noremap = true, silent = true })
	vim.api.nvim_set_keymap("n", "gQ", ":QPrev<CR>", { noremap = true, silent = true })
	vim.cmd([[autocmd FileType qf          nnoremap <buffer> dd :Reject<CR>]])
	vim.cmd([[autocmd FileType qf          xnoremap <buffer> dd :Reject<CR>]])
	-- start replacer.nvim
	vim.cmd([[autocmd FileType qf          nnoremap <buffer> R :lua require("replacer").run()<CR>]])
end
return M
