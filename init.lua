if not vim.g.vscode then
	vim.cmd([[syntax enable]]) -- workaround to null-ls WARN
	require("options")
	require("plugins-config")
	require("lsp")
	require("mappings")
end
