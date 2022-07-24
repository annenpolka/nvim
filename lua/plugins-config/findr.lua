local M = {}

function M.config()
	-- disable nvim-cmp completion on findr
	vim.api.nvim_create_autocmd({ "FileType" }, {
		pattern = "findr.*",
		callback = function()
			require("cmp").setup.buffer({ enabled = false })
		end,
	})
end

function M.map()
	nnoremap("<C-e>", "<Cmd>Findr<CR>", { noremap = true, silent = true })
end

return M
