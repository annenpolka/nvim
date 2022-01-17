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
	vim.api.nvim_set_keymap("n", "q", ":QNext<CR>", { noremap = true, silent = true })
	vim.api.nvim_set_keymap("n", "Q", ":QPrev<CR>", { noremap = true, silent = true })
	vim.cmd([[autocmd FileType qf          nnoremap <buffer> dd :Reject<CR>]])
	vim.cmd([[autocmd FileType qf          xnoremap <buffer> dd :Reject<CR>]])
end
return M
