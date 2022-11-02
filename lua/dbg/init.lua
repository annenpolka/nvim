-- require defined dap configuration for each language
-- NOTE: this has performance problem
-- for _, ft_path in ipairs(vim.api.nvim_get_runtime_file("lua/dbg/languages/*.lua", true)) do
-- 	local ft = vim.fn.fnamemodify(ft_path, ":t:r")
-- 	require("dbg.languages." .. ft)
-- end

require("dbg.languages.cpp")
require("dbg.languages.rust")
