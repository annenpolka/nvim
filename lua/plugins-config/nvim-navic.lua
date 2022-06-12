local M = {}

function M.config()
	local navic = require("nvim-navic")
	local icons = {
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
	}
	navic.setup({
		icons = icons,
		highlight = false,
		separator = " > ",
		depth_limit = 0,
		depth_limit_indicator = "..",
	})
	-- set_highlight("NavicText", { link = "SignColumn" })
	-- set_highlight("NavicIconsFunction", { link = "AerialFunctionIcon" })
	-- set_highlight("NavicIconsModule", { link = "FunctionModuleIcon" })
end

return M
