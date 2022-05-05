local M = {}

function M.config()
	local augend = require("dial.augend")
	require("dial.config").augends:register_group({
		default = {
			augend.integer.alias.decimal,
			augend.integer.alias.hex,
			augend.constant.alias.bool,
			augend.semver.alias.semver,
			augend.date.alias["%Y/%m/%d"],
		},
		typescript = {
			augend.integer.alias.decimal,
			augend.integer.alias.hex,
			augend.constant.new({ elements = { "let", "const" } }),
		},
		visual = {
			augend.integer.alias.decimal,
			augend.integer.alias.hex,
			augend.date.alias["%Y/%m/%d"],
			augend.constant.alias.alpha,
			augend.constant.alias.Alpha,
		},
	})
end

function M.map()
	vim.keymap.set("n", "<C-a>", require("dial.map").inc_normal(), { noremap = true })
	vim.keymap.set("n", "<C-x>", require("dial.map").dec_normal(), { noremap = true })
	vim.keymap.set("v", "<C-a>", require("dial.map").inc_visual("visual"), { noremap = true })
	vim.keymap.set("v", "<C-x>", require("dial.map").dec_visual("visual"), { noremap = true })
	vim.keymap.set("v", "g<C-a>", require("dial.map").inc_gvisual("visual"), { noremap = true })
	vim.keymap.set("v", "g<C-x>", require("dial.map").dec_gvisual("visual"), { noremap = true })
	vim.api.nvim_create_autocmd("FileType", {
		pattern = "typescript",
		callback = function()
			vim.api.nvim_buf_set_keymap(
				0,
				"n",
				"<C-a>",
				require("dial.map").inc_normal("typescript"),
				{ noremap = true }
			)
			vim.api.nvim_buf_set_keymap(
				0,
				"n",
				"<C-x>",
				require("dial.map").dec_normal("typescript"),
				{ noremap = true }
			)
		end,
	})
end

return M
