local M = {}

function M.map()
	-- ╭──────────────────────────────────────────────────────────╮
	-- │       chainmember (method chain member textobject)       │
	-- ╰──────────────────────────────────────────────────────────╯
	vim.g.textobj_chainmember_no_default_key_mappings = 0
	xmap("im", "<Plug>(textobj-chainmember-i)", "silent")
	omap("im", "<Plug>(textobj-chainmember-i)", "silent")
	xmap("am", "<Plug>(textobj-chainmember-a)", "silent")
	omap("am", "<Plug>(textobj-chainmember-a)", "silent")
	xmap("i.", "<Plug>(textobj-chainmember-i)", "silent")
	omap("i.", "<Plug>(textobj-chainmember-i)", "silent")
	xmap("a.", "<Plug>(textobj-chainmember-a)", "silent")
	omap("a.", "<Plug>(textobj-chainmember-a)", "silent")
end

return M
