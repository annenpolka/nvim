local M = {}

function M.config()
	require("trld").setup({
		-- where to render the diagnostics. 'top' | 'bottom'
		position = "top",

		-- if this plugin should execute it's builtin auto commands
		auto_cmds = true,

		-- diagnostics highlight group names
		highlights = {
			error = "DiagnosticFloatingError",
			warn = "DiagnosticFloatingWarn",
			info = "DiagnosticFloatingInfo",
			hint = "DiagnosticFloatingHint",
		},

		-- diagnostics formatter. must return
		-- {
		--   {{ "String", "Highlight Group Name"}},
		--   {{ "String", "Highlight Group Name"}},
		--   {{ "String", "Highlight Group Name"}},
		--   ...
		-- }
		formatter = function(diag)
			local u = require("trld.utils")
			local diag_lines = {}

			for line in diag.message:gmatch("[^\n]+") do
				line = line:gsub("[ \t]+%f[\r\n%z]", "")
				-- exclude unnecessary messages
				local exclude_str_list = { "on by default" }
				local is_excluded = false
				for _, exclude_str in ipairs(exclude_str_list) do
					if line:find(exclude_str) then
						is_excluded = true
						break
					end
				end
				if not is_excluded then
					table.insert(diag_lines, line)
				end
			end

			local lines = {}
			for _, diag_line in ipairs(diag_lines) do
				table.insert(lines, { { diag_line .. " ", u.get_hl_by_serverity(diag.severity) } })
			end

			return lines
		end,
	})
	vim.diagnostic.config({ virtual_text = false }) -- disable builtin virtual_text
end

return M
