local M = {}

function M.config()
	vim.g.translator_target_lang = "ja"
	vim.g.translator_default_engines = { "google", "bing" }
	vim.g.translator_history_enable = true
end

function M.map()
	nnoremap("<leader>T", "<Cmd>TranslateW<CR>", { silent = true })
	vnoremap("<leader>T", ":TranslateW<CR>", { silent = true })
end

return M
