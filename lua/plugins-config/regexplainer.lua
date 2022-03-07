local M = {}

function M.config()
	require("regexplainer").setup({
		mode = "narrative",

		-- automatically show the explainer when the cursor enters a regexp
		auto = true,

		-- Whether to log debug messages
		debug = false,

		-- 'split', 'popup'
		display = "popup",

		mappings = {
			show = "gR",
		},

		narrative = {
			separator = "\n",
		},
	})
end

return M
