local M = {}

function M.config()
	require("indent_blankline").setup({
		show_current_context = true,
		show_current_context_start = true,
	})

	-- Actually, no setup is required, but
	-- if setup comes after the indent_blankline,
	-- it will try to follow the pattern matching options
	-- used in indent_blankline
	require("treesitter_indent_object").setup()
end

function M.map()
	-- select context-aware indent
	vim.keymap.set({ "x", "o" }, "ai", "<Cmd>lua require'treesitter_indent_object.textobj'.select_indent_outer()<CR>")
	-- ensure selecting entire line (or just use Vai)
	vim.keymap.set(
		{ "x", "o" },
		"aI",
		"<Cmd>lua require'treesitter_indent_object.textobj'.select_indent_outer(true)<CR>"
	)
	-- select inner block (only if block, only else block, etc.)
	vim.keymap.set({ "x", "o" }, "ii", "<Cmd>lua require'treesitter_indent_object.textobj'.select_indent_inner()<CR>")
	-- select entire inner range (including if, else, etc.)
	vim.keymap.set(
		{ "x", "o" },
		"iI",
		"<Cmd>lua require'treesitter_indent_object.textobj'.select_indent_inner(true)<CR>"
	)
end

return M
