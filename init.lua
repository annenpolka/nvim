-- optimize loading
local has_impatient = pcall(require, "impatient")
if has_impatient then
	require("impatient").enable_profile()
end

if not vim.g.vscode then
	vim.cmd([[syntax enable]]) -- workaround to null-ls WARN
	require("options")
	require("plugins-config")
	require("lsp")
	require("mappings")
end
