local M = {}

function M.config()
	local z_utils = require("telescope._extensions.zoxide.utils")
	local builtin = require("telescope.builtin")

	require("telescope._extensions.zoxide.config").setup({
		prompt_title = "[ zoxide ]",

		-- Zoxide list command with score
		list_command = "zoxide query -ls",
		mappings = {
			default = {
				action = function(selection)
					vim.cmd("cd " .. selection.path)
				end,
				after_action = function(selection)
					print("Directory changed to " .. selection.path)
				end,
			},
			["<C-s>"] = { action = z_utils.create_basic_command("split") },
			["<C-v>"] = { action = z_utils.create_basic_command("vsplit") },
			["<C-e>"] = { action = z_utils.create_basic_command("edit") },
			["<C-b>"] = {
				keepinsert = true,
				action = function(selection)
					builtin.file_browser({ cwd = selection.path[0] })
				end,
			},
			["<C-f>"] = {
				keepinsert = true,
				action = function(selection)
					builtin.find_files({ cwd = selection.path })
				end,
			},
		},
	})

	require("telescope").load_extension("zoxide")
end

return M
