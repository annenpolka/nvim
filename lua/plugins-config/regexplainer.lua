local M = {}

function M.config()
	require("regexplainer").setup({
		mode = "narrative",

		-- automatically show the explainer when the cursor enters a regexp
		auto = true,

		-- filetypes (i.e. extensions) in which to run the autocommand
		filetypes = {
			"html",
			"js",
			"cjs",
			"mjs",
			"ts",
			"jsx",
			"tsx",
			"cjsx",
			"mjsx",
		},
		-- Whether to log debug messages
		debug = false,

		display = "popup",

		mappings = {
			toggle = "gR",
		},

		narrative = {
			separator = "\n",
		},
	})
end

return M
