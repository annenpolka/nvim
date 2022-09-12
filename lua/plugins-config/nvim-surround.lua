local M = {}

function M.config()
	require("nvim-surround").setup({
		keymaps = {
			insert = "<C-^>s",
			insert_line = "<C-^>S",
			normal = "ys",
			normal_cur = "yss",
			normal_line = "ySS",
			normal_cur_line = "yS",
			visual = "S",
			visual_line = "gS",
			delete = "ds",
			change = "cs",
		},
	})
end

return M
