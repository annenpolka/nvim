local M = {}

function M.config()
	require("which-key").setup({
		plugins = {
			presets = {
				operators = true,
			},
			registers = false,
		},
		triggers_blacklist = {
			-- list of mode / prefixes that should never be hooked by WhichKey
			-- this is mostly relevant for key maps that start with a native binding
			i = { "j", "k" },
			v = { "j", "k" },
			n = { "v" },
		},
	})
end

return M
