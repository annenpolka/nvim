local M = {}

local function set_navic_highlights()
	vim.api.nvim_set_hl(0, "NavicIconsFile", { default = true, fg = "#ffffff" })
	vim.api.nvim_set_hl(0, "NavicIconsModule", { default = true, link = "TSNamespace" })
	vim.api.nvim_set_hl(0, "NavicIconsNamespace", { default = true, link = "TSNamespace" })
	vim.api.nvim_set_hl(0, "NavicIconsPackage", { default = true, link = "TSNamespace" })
	vim.api.nvim_set_hl(0, "NavicIconsClass", { default = true, link = "TSNamespace" })
	vim.api.nvim_set_hl(0, "NavicIconsMethod", { default = true, link = "TSMethod" })
	vim.api.nvim_set_hl(0, "NavicIconsProperty", { default = true, link = "TSProperty" })
	vim.api.nvim_set_hl(0, "NavicIconsField", { default = true, link = "TSField" })
	vim.api.nvim_set_hl(0, "NavicIconsConstructor", { default = true, link = "TSConstructor" })
	vim.api.nvim_set_hl(0, "NavicIconsEnum", { default = true, link = "TSNumber" })
	vim.api.nvim_set_hl(0, "NavicIconsInterface", { default = true, fg = "#ffffff" })
	vim.api.nvim_set_hl(0, "NavicIconsFunction", { default = true, link = "TSFunction" })
	vim.api.nvim_set_hl(0, "NavicIconsVariable", { default = true, link = "TSVariable" })
	vim.api.nvim_set_hl(0, "NavicIconsConstant", { default = true, link = "TSConstant" })
	vim.api.nvim_set_hl(0, "NavicIconsString", { default = true, link = "TSString" })
	vim.api.nvim_set_hl(0, "NavicIconsNumber", { default = true, link = "TSNumber" })
	vim.api.nvim_set_hl(0, "NavicIconsBoolean", { default = true, link = "TSBoolean" })
	vim.api.nvim_set_hl(0, "NavicIconsArray", { default = true, link = "TSPunctBracket" })
	vim.api.nvim_set_hl(0, "NavicIconsObject", { default = true, link = "TSConstructor" })
	vim.api.nvim_set_hl(0, "NavicIconsKey", { default = true, fg = "#ffffff" })
	vim.api.nvim_set_hl(0, "NavicIconsNull", { default = true, fg = "#ffffff" })
	vim.api.nvim_set_hl(0, "NavicIconsEnumMember", { default = true, fg = "#ffffff" })
	vim.api.nvim_set_hl(0, "NavicIconsStruct", { default = true, fg = "#ffffff" })
	vim.api.nvim_set_hl(0, "NavicIconsEvent", { default = true, fg = "#ffffff" })
	vim.api.nvim_set_hl(0, "NavicIconsOperator", { default = true, link = "TSOperator" })
	vim.api.nvim_set_hl(0, "NavicIconsTypeParameter", { default = true, link = "TSType" })
	vim.api.nvim_set_hl(0, "NavicText", { default = true, link = "TSNone" })
	vim.api.nvim_set_hl(0, "NavicSeparator", { default = true, fg = "#999999" })
end
function M.config()
	local navic = require("nvim-navic")
	navic.setup({
		icons = {
			File = " ",
			Module = " ",
			Namespace = " ",
			Package = " ",
			Class = " ",
			Method = " ",
			Property = " ",
			Field = " ",
			Constructor = " ",
			Enum = "練",
			Interface = "練",
			Function = " ",
			Variable = " ",
			Constant = " ",
			String = " ",
			Number = " ",
			Boolean = "◩ ",
			Array = " ",
			Object = " ",
			Key = " ",
			Null = "ﳠ ",
			EnumMember = " ",
			Struct = " ",
			Event = " ",
			Operator = " ",
			TypeParameter = " ",
		},
		highlight = true,
		separator = "  ",
		depth_limit = 0,
		depth_limit_indicator = "..",
	})
	set_navic_highlights()

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
					"Outline",
					"spectre_panel",
					"toggleterm",
				},
			},
			always_divide_middle = true,
			globalstatus = true,
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = { "branch", "diff", "diagnostics" },
			-- lualine_c = { { navic.get_location, cond = navic.is_available } },
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
