local M = {}

function M.config()
	M.git_mode()
	-- M.quickfix_mode()
end

function M.git_mode()
	local Hydra = require("hydra")
	local gitsigns = require("gitsigns")

	local hint = [[
   _J_: next hunk   _s_: stage hunk        _d_: show deleted   _b_: blame line
   _K_: prev hunk   _S_: stage buffer      _p_: preview hunk   _B_: blame show full 
   _x_: reset hunk  _u_: undo stage hunk   ^ ^                 _/_: show base file
   _c_: commit      ^ ^                    _e_: status
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
				gitsigns.attach()
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
			{ "s", ":Gitsigns stage_hunk<CR>", { silent = true, nowait = true } },
			{ "u", gitsigns.undo_stage_hunk, { nowait = true } },
			{
				"x",
				function()
					vim.bo.modifiable = true -- set temporarily to use reset_hunk
					gitsigns.reset_hunk()
					vim.bo.modifiable = false
				end,
				{ silent = true, nowait = true },
			},
			{ "S", gitsigns.stage_buffer, nowait = true },
			{ "p", gitsigns.preview_hunk, nowait = true },
			{ "d", gitsigns.toggle_deleted, { nowait = true } },
			{ "b", gitsigns.blame_line },
			{
				"B",
				function()
					gitsigns.blame_line({ full = true })
				end,
			},
			{ "e", "<Cmd>Neotree git_status float toggle<CR>", { nowait = true } }, -- show the base of the file
			{ "c", "<cmd>Neogit<CR><cmd>Neogit commit<CR>", { nowait = true, exit = true } },
			{ "/", gitsigns.show, { exit = true } }, -- show the base of the file
			{ "<Enter>", "<cmd>Neogit<CR>", { exit = true } },
			{ "q", nil, { exit = true, nowait = true } },
		},
	})
end

function M.quickfix_mode()
	local Hydra = require("hydra")

	local hint = [[_Q_: Toggle Quickfix _L_: Toggle Loclist _n_: QFNext _p_: QFPrev _q_: exit]]

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
				-- vim.cmd("QFOpen")
			end,
			on_exit = function() end,
		},
		mode = { "n", "x" },
		body = "Q",
		heads = {
			{ "Q", ":QFToggle<CR>", { silent = true } },
			{ "L", ":LLToggle<CR>", { silent = true } },
			{ "n", ":QNext<CR>", { silent = true } },
			{ "p", ":QPrev<CR>", { silent = true } },
			{ "q", nil, { exit = true, nowait = true } },
		},
	})
end

return M
