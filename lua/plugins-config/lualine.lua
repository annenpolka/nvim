local M = {}

function M.config()
	local navic = require("nvim-navic")

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
			theme = "auto",
			component_separators = { left = "", right = "" },
			section_separators = { left = "", right = "" },
			disabled_filetypes = {
				statusline = {},
				winbar = {
					"help",
					"startify",
					"dashboard",
					"packer",
					"Trouble",
					"NeogitStatus",
					"alpha",
					"lir",
					"ddu-ff",
					"ddu-ff-filter",
					"neo-tree",
					"Outline",
					"spectre_panel",
					"toggleterm",
					"OverseerList",
				},
			},
			always_divide_middle = true,
			globalstatus = true,
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = { "branch", "diff", "diagnostics" },
			-- lualine_c = {
			-- 	{
			-- 		function()
			-- 			local key = require("grapple").key()
			-- 			return " [" .. key .. "]"
			-- 		end,
			-- 		cond = require("grapple").exists,
			-- 	},
			-- },
			lualine_x = {
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
		winbar = {
			lualine_a = {
				{
					"diagnostics",
					colored = false,
					separator = { left = "", right = " " },
				},
			},
			lualine_b = {
				{
					"filetype",
					icon_only = true, -- Display only an icon for filetype
					separator = "",
					color = "Visual",
				},
				{
					"filename",
					shorting_target = 40,
					color = "Visual",
					separator = { left = "", right = " " },
				},
			},
			lualine_c = {
				{
					navic.get_location,
					cond = navic.is_available,
				},
			},
			lualine_x = {},

			lualine_y = {},
			lualine_z = {},
		},
		inactive_winbar = {
			lualine_a = {
				{
					"diagnostics",
					colored = false,
					separator = { left = "", right = " " },
				},
			},
			lualine_b = {
				{
					"filetype",
					icon_only = true, -- Display only an icon for filetype
					separator = "",
					-- color = "Visual",
				},
				{
					"filename",
					shorting_target = 40,
					-- color = "Visual",
					separator = { left = "", right = " " },
				},
			},
			lualine_c = {},
			lualine_x = {},
			lualine_y = {},
			lualine_z = {},
		},
		tabline = {},
		extensions = {},
	})
end

return M
