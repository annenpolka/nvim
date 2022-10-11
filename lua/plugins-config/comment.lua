local M = {}

function M.config()
	require("Comment").setup({
		---Add a space b/w comment and the line
		padding = true,
		---Whether the cursor should stay at its position
		sticky = true,
		---Lines to be ignored while (un)comment
		ignore = nil,
		---LHS of toggle mappings in NORMAL mode
		toggler = {
			---Line-comment toggle keymap
			line = "gcc",
			---Block-comment toggle keymap
			block = "gbc",
		},
		---LHS of operator-pending mappings in NORMAL and VISUAL mode
		opleader = {
			---Line-comment keymap
			line = "gc",
			---Block-comment keymap
			block = "gb",
		},
		---LHS of extra mappings
		extra = {
			---Add comment on the line above
			above = "gcO",
			---Add comment on the line below
			below = "gco",
			---Add comment at the end of line
			eol = "gcA",
		},
		---Enable keybindings
		---NOTE: If given `false` then the plugin won't create any mappings
		mappings = {
			---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
			basic = true,
			---Extra mapping; `gco`, `gcO`, `gcA`
			extra = true,
		},
		---Function to call before (un)comment
		pre_hook = nil,
		---Function to call after (un)comment
		post_hook = nil,
	})

	-- set comment style
	local comment_ft = require("Comment.ft")
	comment_ft.set("lua", { "--%s", "--[[%s]]" })
end

function M.map()
	-- # NORMAL mode
	-- Linewise toggle current line using C-/
	vim.keymap.set("n", "<C-_>", '<CMD>lua require("Comment.api").toggle.linewise.current()<CR>')
	-- Blockwise toggle current line using C-\
	vim.keymap.set("n", "<C-\\>", '<CMD>lua require("Comment.api").toggle.blockwise.current()<CR>')

	-- # VISUAL mode
	-- Linewise toggle using C-/
	vim.keymap.set("x", "<C-_>", '<ESC><CMD>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>')
	-- Blockwise toggle using <leader>gb
	vim.keymap.set("x", "<leader>gb", '<ESC><CMD>lua require("Comment.api").toggle.blockwise(vim.fn.visualmode())<CR>')
end

return M
