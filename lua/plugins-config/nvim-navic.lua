local M = {}

local function set_navic_highlights()
	vim.api.nvim_set_hl(0, "NavicIconsFile", { default = true, link = "CmpItemKindFile" })
	vim.api.nvim_set_hl(0, "NavicIconsModule", { default = true, link = "CmpItemKindModule" })
	vim.api.nvim_set_hl(0, "NavicIconsNamespace", { default = true, link = "CmpItemKind" })
	vim.api.nvim_set_hl(0, "NavicIconsPackage", { default = true, link = "CmpItemKind" })
	vim.api.nvim_set_hl(0, "NavicIconsClass", { default = true, link = "CmpItemKindClass" })
	vim.api.nvim_set_hl(0, "NavicIconsMethod", { default = true, link = "CmpItemKindFunction" })
	vim.api.nvim_set_hl(0, "NavicIconsProperty", { default = true, link = "CmpItemKindProperty" })
	vim.api.nvim_set_hl(0, "NavicIconsField", { default = true, link = "CmpItemKindField" })
	vim.api.nvim_set_hl(0, "NavicIconsConstructor", { default = true, link = "CmpItemKindConstructor" })
	vim.api.nvim_set_hl(0, "NavicIconsEnum", { default = true, link = "CmpItemKindEnum" })
	vim.api.nvim_set_hl(0, "NavicIconsInterface", { default = true, link = "CmpItemKindInterface" })
	vim.api.nvim_set_hl(0, "NavicIconsFunction", { default = true, link = "CmpItemKindFunction" })
	vim.api.nvim_set_hl(0, "NavicIconsVariable", { default = true, link = "CmpItemKindVariable" })
	vim.api.nvim_set_hl(0, "NavicIconsConstant", { default = true, link = "CmpItemKindConstant" })
	vim.api.nvim_set_hl(0, "NavicIconsString", { default = true, link = "TSString" })
	vim.api.nvim_set_hl(0, "NavicIconsNumber", { default = true, link = "TSNumber" })
	vim.api.nvim_set_hl(0, "NavicIconsBoolean", { default = true, link = "TSBoolean" })
	vim.api.nvim_set_hl(0, "NavicIconsArray", { default = true, link = "TSPunctBracket" })
	vim.api.nvim_set_hl(0, "NavicIconsObject", { default = true, link = "TSConstructor" })
	vim.api.nvim_set_hl(0, "NavicIconsKey", { default = true, link = "CmpItemKindProperty" })
	vim.api.nvim_set_hl(0, "NavicIconsNull", { default = true, fg = "#ffffff" })
	vim.api.nvim_set_hl(0, "NavicIconsEnumMember", { default = true, link = "CmpItemKindEnumMember" })
	vim.api.nvim_set_hl(0, "NavicIconsStruct", { default = true, link = "CmpItemKindStruct" })
	vim.api.nvim_set_hl(0, "NavicIconsEvent", { default = true, link = "CmpItemKindEvent" })
	vim.api.nvim_set_hl(0, "NavicIconsOperator", { default = true, link = "CmpItemKindOperator" })
	vim.api.nvim_set_hl(0, "NavicIconsTypeParameter", { default = true, link = "CmpItemKindTypeParameter" })
	vim.api.nvim_set_hl(0, "NavicText", { default = true, link = "MsgArea" })
	vim.api.nvim_set_hl(0, "NavicSeparator", { default = true, fg = "#7A7A99" })
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

	-- set_highlight("NavicText", { link = "SignColumn" })
	-- set_highlight("NavicIconsFunction", { link = "AerialFunctionIcon" })
	-- set_highlight("NavicIconsModule", { link = "FunctionModuleIcon" })
end

return M
