local M = {}

function M.config()
	vim.g.scratch_no_mappings = 1
	vim.g.scratch_insert_autohide = 1
	vim.g.scratch_filetype = "markdown"
	-- map <C-q> to scratch buffer, to avoid closing it
	vim.api.nvim_create_autocmd("BufWinEnter", {
		pattern = "__Scratch__",
		callback = function()
			vim.keymap.set("n", "<C-q>", "<C-w>j", { buffer = 0 })
		end,
	})
end

function M.map()
	nmap("<leader>gs", ":Scratch<CR>")
	nmap("<leader>gS", ":Scratch!<CR>")
	xmap("<leader>gs", ":ScratchSelection<CR>")
	xmap("<leader>gS", ":ScratchSelection!<CR>")
end

return M
