local M = {}

function M.config()
	require("syntax-tree-surfer").setup({
		highlight_group = "STS_highlight",
		disable_no_instance_found_report = false,
		default_desired_types = {
			-- "arguments",
			"function_call",
			"variable_declaration",
			"table_constructor",
			"function",
			"function_item",
			"express_statement",
			"macro_invocation",
			"if_statement",
			"if_expression",
			"if_let_expression",
			"if_expression",
			"else_clause",
			"else_statement",
			"elseif_statement",
			"for_statement",
			"while_statement",
			"switch_statement",
		},
		left_hand_side = "fdsawervcxqtzb",
		right_hand_side = "jkl;oiu.,mpy/n",
		icon_dictionary = {
			["if_statement"] = "",
			["if_expression"] = "",
			["if_let_expression"] = "",
			["else_clause"] = "",
			["else_statement"] = "",
			["elseif_statement"] = "",
			["for_statement"] = "ﭜ",
			["while_statement"] = "ﯩ",
			["switch_statement"] = "ﳟ",
			["function"] = "",
			["function_item"] = "",
			["function_call"] = "",
			["express_statement"] = "",
			["macro_invocation"] = "",
			["variable_declaration"] = "",
			["arguments"] = "ﰠ",
			["parameters"] = "ﰠ",
			["table_constructor"] = "ﰠ",
			["field"] = "ﰠ",
		},
	})
	set_highlight("STS_highlight", { fg = "#A999FF", bg = "#292F4F" })
end

function M.map()
	-- Syntax Tree Surfer V2 Mappings
	-- Targeted Jump with virtual_text
	local stf = require("syntax-tree-surfer")
	local opts = {}
	vim.keymap.set("n", "gv", function() -- only jump to variable_declarations
		stf.targeted_jump({ "variable_declaration" })
	end, opts)
	vim.keymap.set("n", "gfu", function() -- only jump to functions
		stf.targeted_jump({ "function", "function_item" })
	end, opts)
	vim.keymap.set("n", "gif", function() -- only jump to if_statements
		stf.targeted_jump({ "if_statement", "if_expression", "if_let_expression" })
	end, opts)
	vim.keymap.set("n", "gfo", function() -- only jump to for_statements
		stf.targeted_jump({ "for_statement" })
	end, opts)
	vim.keymap.set("n", "gj", function() -- jump to all that you specify
		stf.targeted_jump({
			"function",
			"function_item",
			"function_call",
			"express_statement",
			"macro_invocation",
			"if_statement",
			"if_expression",
			"if_let_expression",
			"else_clause",
			"else_statement",
			"elseif_statement",
			"for_statement",
			"while_statement",
			"switch_statement",
		})
	end, opts)

	vim.keymap.set("n", "ga", function()
		stf.targeted_jump({
			"table_constructor",
			"arguments",
			-- "field",
			"parameters",
		}) --> true means jump forward
	end, opts)

	-------------------------------
	-- filtered_jump --
	-- "default" means that you jump to the default_desired_types or your lastest jump types
	vim.keymap.set("n", "<A-n>", function()
		stf.filtered_jump("default", true) --> true means jump forward
	end, opts)
	vim.keymap.set("n", "<A-p>", function()
		stf.filtered_jump("default", false) --> false means jump backwards
	end, opts)

	-- non-default jump --> custom desired_types
	-- parameters jump
	-- vim.keymap.set("n", "ga", function()
	-- 	stf.filtered_jump({
	-- 		"table_constructor",
	-- 		"arguments",
	-- 		"field",
	-- 	}, true) --> true means jump forward
	-- end, opts)
	-- vim.keymap.set("n", "your_keymap", function()
	-- 	stf.filtered_jump({
	-- 		"if_statement","if_expression","if_let_expression",
	-- 		"else_clause",
	-- 		"else_statement",
	-- 	}, false) --> false means jump backwards
	-- end, opts)

	-------------------------------
	-- jump with limited targets --
	-- jump to sibling nodes only
	-- vim.keymap.set("n", "-", function()
	-- 	stf.filtered_jump({
	-- 		"if_statement",
	-- 		"if_expression",
	-- 		"if_let_expression",
	-- 		"else_clause",
	-- 		"else_statement",
	-- 	}, false, { destination = "siblings" })
	-- end, opts)
	-- vim.keymap.set("n", "=", function()
	-- 	stf.filtered_jump(
	-- 		{ "if_statement", "if_expression", "if_let_expression", "else_clause", "else_statement" },
	-- 		true,
	-- 		{ destination = "siblings" }
	-- 	)
	-- end, opts)

	-- jump to parent or child nodes only
	vim.keymap.set("n", "_", function()
		stf.filtered_jump({
			"if_statement",
			"if_expression",
			"if_let_expression",
			"else_clause",
			"else_statement",
		}, false, { destination = "parent" })
	end, opts)
	vim.keymap.set("n", "+", function()
		stf.filtered_jump({
			"if_statement",
			"if_expression",
			"if_let_expression",
			"else_clause",
			"else_statement",
		}, true, { destination = "children" })
	end, opts)

	-- NAVIGATION: Only change the keymap to your liking. I would not recommend changing anything about the .surf() parameters!
	vim.keymap.set(
		"x",
		"J",
		'<cmd>lua require("syntax-tree-surfer").surf("next", "visual")<cr>',
		{ noremap = true, silent = true }
	)
	vim.keymap.set(
		"x",
		"K",
		'<cmd>lua require("syntax-tree-surfer").surf("prev", "visual")<cr>',
		{ noremap = true, silent = true }
	)
	vim.keymap.set(
		"x",
		"H",
		'<cmd>lua require("syntax-tree-surfer").surf("parent", "visual")<cr>',
		{ noremap = true, silent = true }
	)
	vim.keymap.set(
		"x",
		"L",
		'<cmd>lua require("syntax-tree-surfer").surf("child", "visual")<cr>',
		{ noremap = true, silent = true }
	)
	-- SWAPPING WITH VISUAL SELECTION: Only change the keymap to your liking. Don't change the .surf() parameters!
	vim.keymap.set(
		"x",
		"<leader>j",
		'<cmd>lua require("syntax-tree-surfer").surf("next", "visual", true)<cr>',
		{ noremap = true, silent = true }
	)
	vim.keymap.set(
		"x",
		"<leader>k",
		'<cmd>lua require("syntax-tree-surfer").surf("prev", "visual", true)<cr>',
		{ noremap = true, silent = true }
	)
end

return M
