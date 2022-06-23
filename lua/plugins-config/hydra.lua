local M = {}

function M.git_mode()
	local Hydra = require("hydra")
	local gitsigns = require("gitsigns")

	local hint = [[
   _J_: next hunk   _s_: stage hunk        _d_: show deleted   _b_: blame line
   _K_: prev hunk   _u_: undo stage hunk   _p_: preview hunk   _B_: blame show full 
   _x_: reset hunk  _S_: stage buffer      ^ ^                 _/_: show base file
   ^ ^              _C_: commit
   ^ ^              _<Enter>_: Neogit              _q_: exit
  ]]

	Hydra({
		hint = hint,
		config = {
			color = "pink",
			invoke_on_body = true,
			hint = {
				position = "bottom",
				border = "rounded",
			},
			on_enter = function()
				vim.bo.modifiable = false
				gitsigns.toggle_linehl(true)
			end,
			on_exit = function()
				gitsigns.toggle_linehl(false)
				gitsigns.toggle_deleted(false)
				vim.cmd("echo") -- clear the echo area
			end,
		},
		mode = { "n", "x" },
		body = "<leader>g",
		heads = {
			{
				"J",
				function()
					if vim.wo.diff then
						return "]c"
					end
					vim.schedule(function()
						gitsigns.next_hunk()
					end)
					return "<Ignore>"
				end,
				{ expr = true },
			},
			{
				"K",
				function()
					if vim.wo.diff then
						return "[c"
					end
					vim.schedule(function()
						gitsigns.prev_hunk()
					end)
					return "<Ignore>"
				end,
				{ expr = true },
			},
			{ "s", ":Gitsigns stage_hunk<CR>", { silent = true } },
			{ "u", gitsigns.undo_stage_hunk },
			{
				"x",
				function()
					vim.bo.modifiable = true -- set temporarily to use reset_hunk
					gitsigns.reset_hunk()
					vim.bo.modifiable = false
				end,
				{ silent = true },
			},
			{ "S", gitsigns.stage_buffer },
			{ "p", gitsigns.preview_hunk },
			{ "d", gitsigns.toggle_deleted, { nowait = true } },
			{ "b", gitsigns.blame_line },
			{
				"B",
				function()
					gitsigns.blame_line({ full = true })
				end,
			},
			{ "C", "<cmd>Neogit commit<CR>", { exit = true } },
			{ "/", gitsigns.show, { exit = true } }, -- show the base of the file
			{ "<Enter>", "<cmd>Neogit<CR>", { exit = true } },
			{ "q", nil, { exit = true, nowait = true } },
		},
	})
end

return M
