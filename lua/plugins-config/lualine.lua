local M = {}

function M.config()
	local gps = require("nvim-gps")
	-- Override 'encoding': Don't display if encoding is UTF-8.
	local encoding = function()
		local ret, _ = (vim.bo.fenc or vim.go.enc):gsub("^utf%-8$", "")
		return ret
	end
	-- fileformat: Don't display if &ff is unix.
	local fileformat = function()
		local ret, _ = vim.bo.fileformat:gsub("^unix$", "")
		return ret
	end
	require("lualine").setup({
		options = {
			icons_enabled = true,
			theme = "sherbet",
			component_separators = { left = "", right = "" },
			section_separators = { left = "", right = "" },
			disabled_filetypes = {},
			always_divide_middle = true,
			globalstatus = true,
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = { "branch", "diff", "diagnostics" },
			-- nvim-gps breadcrumb section
			lualine_c = { { gps.get_location, cond = gps.is_available } },
			lualine_x = {
				-- {
				-- 	"buffers",
				-- 	show_filename_only = true, -- Shows shortened relative path when set to false.
				-- 	show_modified_status = true, -- Shows indicator when the buffer is modified.

				-- 	mode = 0, -- 0: Shows buffer name
				-- 	-- 1: Shows buffer index (bufnr)
				-- 	-- 2: Shows buffer name + buffer index (bufnr)

				-- 	max_length = vim.o.columns * 2 / 5, -- Maximum width of buffers component,
				-- 	-- it can also be a function that returns
				-- 	-- the value of `max_length` dynamically.
				-- 	filetype_names = {
				-- 		TelescopePrompt = "Telescope",
				-- 		fzf = "FZF",
				-- 		alpha = "Alpha",
				-- 	}, -- Shows specific buffer name for that filetype ( { `filetype` = `buffer_name`, ... } )

				-- 	buffers_color = {
				-- 		-- Same values as the general color option can be used here.
				-- 		active = "Aqua", -- Color for active buffer.
				-- 		-- inactive = "lualine_{section}_inactive", -- Color for inactive buffer.
				-- 	},
				-- },
				encoding,
				fileformat,
				"filetype",
			},
			lualine_y = { "progress" },
			lualine_z = {},
		},
		inactive_sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = { "filename" },
			lualine_x = { "location" },
			lualine_y = {},
			lualine_z = {},
		},
		tabline = {},
		extensions = {},
	})
end

return M
