local M = {}

function M.config()
	require("hlargs").setup({
		color = "#ea804a",
		excluded_filetypes = {},
		paint_arg_declarations = true,
		paint_arg_usages = true,
		hl_priority = 10000,
		performance = {
			parse_delay = 1,
			slow_parse_delay = 50,
			max_iterations = 400,
			max_concurrent_partial_parses = 30,
			debounce = {
				partial_parse = 3,
				partial_insert_mode = 100,
				total_parse = 700,
				slow_parse = 5000,
			},
		},
	})
end

return M
