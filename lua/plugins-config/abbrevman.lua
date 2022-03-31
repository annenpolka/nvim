local M = {}

function M.config()
	local abbrev_man = require("abbrev-man")
	abbrev_man.setup({
		load_natural_dictionaries_at_startup = true,
		load_programming_dictionaries_at_startup = true,
		natural_dictionaries = {
			["nt_en"] = {},
		},
		programming_dictionaries = {
			["pr_py"] = {},
			["pr_lua"] = {},
			["pr_java"] = {},
		},
	})
end
return M
