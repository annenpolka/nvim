local M = {}

local palettes = {
	gruvbox_light = {
		accent = "#d65d0e", -- orange
		accent_sec = "#7c6f64", -- fg4
		bg = "#ebdbb2", -- bg1
		bg_sec = "#d5c4a1", -- bg2
		fg = "#504945", -- fg2
		fg_sec = "#665c54", -- fg3
	},
	gruvbox_dark = {
		accent = "#d65d0e", -- orange
		accent_sec = "#a89984", -- fg4
		bg = "#3c3836", -- bg1
		bg_sec = "#504945", -- bg2
		fg = "#d5c4a1", -- fg2
		fg_sec = "#bdae93", -- fg3
	},
	edge_light = {
		accent = "#bf75d6", -- bg_purple
		accent_sec = "#8790a0", -- grey
		bg = "#eef1f4", -- bg1
		bg_sec = "#dde2e7", -- bg4
		fg = "#33353f", -- default:bg1
		fg_sec = "#4b505b", -- fg
	},
	nord = {
		accent = "#88c0d0", -- nord8
		accent_sec = "#81a1c1", -- nord9
		bg = "#3b4252", -- nord1
		bg_sec = "#4c566a", -- nord3
		fg = "#e5e9f0", -- nord4
		fg_sec = "#d8dee9", -- nord4
	},
	catppuccin = {
		accent = "#96CDFB",
		accent_sec = "#89DCEB",
		bg = "#131020",
		bg_sec = "#302D41",
		fg = "#D9E0EE",
		fg_sec = "#C3BAC6",
	},
}

function M.config()
	local palette = palettes.catppuccin
	local filename = require("tabby.filename")
	local util = require("tabby.util")
	local cwd = function()
		return "  " .. vim.fn.fnamemodify(vim.fn.getcwd(), ":t") .. " "
	end
	local tabname = function(tabid)
		local number = vim.api.nvim_tabpage_get_number(tabid)
		local name = util.get_tab_name(tabid)
		-- TODO: improve the way get an file extension
		local icon = require("nvim-web-devicons").get_icon(name) or ""
		return string.format("%d%s %s", number, name, icon)
	end
	local line = {
		hl = { fg = palette.fg, bg = palette.bg },
		layout = "active_wins_at_tail",
		head = {
			{ cwd, hl = { fg = palette.bg_sec, bg = palette.accent } },
			{ " ", hl = { fg = palette.accent, bg = palette.bg } },
		},
		active_tab = {
			label = function(tabid)
				return {
					" " .. tabname(tabid) .. " ",
					hl = { fg = palette.bg, bg = palette.accent_sec, style = "bold" },
				}
			end,
			left_sep = { " ", hl = { fg = palette.accent_sec, bg = palette.bg } },
			right_sep = { " ", hl = { fg = palette.accent_sec, bg = palette.bg } },
		},
		inactive_tab = {
			label = function(tabid)
				return {
					" " .. tabname(tabid) .. " ",
					hl = { fg = palette.fg, bg = palette.bg_sec, style = "bold" },
				}
			end,
			left_sep = { " ", hl = { fg = palette.bg_sec, bg = palette.bg } },
			right_sep = { " ", hl = { fg = palette.bg_sec, bg = palette.bg } },
		},
		top_win = {
			label = function(winid)
				return {
					"  " .. filename.unique(winid) .. " ",
					hl = { fg = palette.fg, bg = palette.bg_sec },
				}
			end,
			left_sep = { " ", hl = { fg = palette.bg_sec, bg = palette.bg } },
			right_sep = { " ", hl = { fg = palette.bg_sec, bg = palette.bg } },
		},
		win = {
			label = function(winid)
				return {
					"  " .. filename.unique(winid) .. " ",
					hl = { fg = palette.fg, bg = palette.bg_sec },
				}
			end,
			left_sep = { " ", hl = { fg = palette.bg_sec, bg = palette.bg } },
			right_sep = { " ", hl = { fg = palette.bg_sec, bg = palette.bg } },
		},
		tail = {
			-- { " ", hl = { fg = palette.accent_sec, bg = palette.bg } },
			-- { "  ", hl = { fg = palette.bg, bg = palette.accent } },
		},
	}
	require("tabby").setup({ tabline = line })
end

function M.map()
	vim.api.nvim_set_keymap("n", "<C-t>", ":$tabnew<CR>", { noremap = true })
	vim.api.nvim_set_keymap("n", "<leader>tc", ":tabclose<CR>", { noremap = true })
	vim.api.nvim_set_keymap("n", "<leader>to", ":tabonly<CR>", { noremap = true })
	vim.api.nvim_set_keymap("n", "<Tab>", ":tabn<CR>", { noremap = true })
	vim.api.nvim_set_keymap("n", "<S-Tab>", ":tabp<CR>", { noremap = true })
	-- move current tab to previous position
	vim.api.nvim_set_keymap("n", "<leader>tmp", ":-tabmove<CR>", { noremap = true })
	-- move current tab to next position
	vim.api.nvim_set_keymap("n", "<leader>tmn", ":+tabmove<CR>", { noremap = true })
end

return M
