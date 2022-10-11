return {
	name = "g++ build with debug options",
	builder = function()
		-- Full path to current file (see :help expand())
		local file = vim.fn.expand("%:p")
		local file_noext = vim.fn.expand("%:r")
		return {
			cmd = { "g++" },
			args = { "-std=c++14", "-O2", "-Wall", file, "-o", file_noext, "-lstdc++", "-lm", "-msse3" },
			components = { { "on_output_quickfix", open = true }, "default" },
		}
	end,
	condition = {
		filetype = { "cpp" },
	},
}
