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
			-- ["<C-e>"] = { action = z_utils.create_basic_command("edit") },
			["<C-e>"] = {
				action = function(selection)
					vim.cmd("VFiler" .. " " .. selection.path .. " " .. "-layout=floating")
				end,
			},
			["<C-f>"] = {
				keepinsert = true,
				action = function(selection)
					builtin.live_grep({ cwd = selection.path })
				end,
			},
			["<CR>"] = {
				keepinsert = true,
				action = function(selection)
					builtin.fd({ cwd = selection.path })
				end,
			},
		},
	})

	require("telescope").load_extension("zoxide")
end

return M
