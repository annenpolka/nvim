local M = {}

local terafox_palette = require("nightfox.palette").load("terafox")
local palettes = {
	gruvbox_light = {
		accent = "#d65d0e", -- orange
		accent_sec = "#7c6f64", -- fg4
		bg = "#ebdbb2", -- bg1
		bg_sec = "#d5c4a1", -- bg2
		bg_third = "#434138", -- bg2
		fg = "#504945", -- fg2
		fg_sec = "#665c54", -- fg3
	},
	gruvbox_dark = {
		accent = "#d65d0e", -- orange
		accent_sec = "#a89984", -- fg4
		bg = "#3c3836", -- bg1
		bg_sec = "#504945", -- bg2
		bg_third = "#434138", -- bg2
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
		bg_third = "#201D31",
		fg = "#e5e9f0", -- nord4
		fg_sec = "#d8dee9", -- nord4
	},
	catppuccin = {
		accent = "#96CDFB",
		accent_sec = "#89DCEB",
		bg = "#131020",
		bg_sec = "#302D41",
		bg_third = "#201D31",
		fg = "#D9E0EE",
		fg_sec = "#C3BAC6",
	},
	terafox = {
		accent = terafox_palette.cyan.base,
		accent_sec = terafox_palette.cyan.bright,
		bg = terafox_palette.bg0,
		bg_sec = terafox_palette.bg2,
		bg_third = terafox_palette.bg3,
		fg = terafox_palette.fg0,
		fg_sec = terafox_palette.fg3,
	},
	sherbet = {
		-- TODO: set sherbet palette
		accent = "#d4d4d4",
		accent_sec = "#89DCEB",
		bg = "#13151b",
		bg_sec = "#13151b",
		bg_third = "#201D31",
		fg = "#D9E0EE",
		fg_sec = "#C3BAC6",
	},
}

function M.config()
	local palette = palettes.sherbet
	local filename = require("tabby.filename")
	local util = require("tabby.util")
	local cwd = function()
		return " " .. vim.fn.fnamemodify(vim.fn.getcwd(), ":t") .. " "
	end
	local webicon = function(name)
		local icon = require("nvim-web-devicons").get_icon(name) or ""
		return icon
	end
	local tabname = function(tabid)
		local number = vim.api.nvim_tabpage_get_number(tabid)
		local name = util.get_tab_name(tabid)
		return string.format("%s", name)
		-- return string.format("%d", number)
	end
	local bufname = function(winid)
		local name = filename.unique(winid)
		return string.format("%s %s", webicon(name), name)
	end
	local line = {
		hl = { fg = palette.fg, bg = palette.bg },
		layout = "active_wins_at_tail",
		head = {
			{ cwd, hl = { fg = palette.accent, bg = palette.bg, style = "italic" } },
			-- { cwd, hl = { fg = palette.bg_sec, bg = palette.accent } },
			{ "", hl = { fg = palette.bg, bg = palette.bg } },
			-- { "", hl = { fg = palette.accent, bg = palette.bg } },
		},
		active_tab = {
			label = function(tabid)
				return {
					" " .. tabname(tabid) .. " ",
					hl = { fg = palette.accent_sec, bg = palette.bg_third, style = "bold" },
					-- hl = { fg = palette.fg, bg = palette.bg_third, style = "bold" },
				}
			end,
			left_sep = { "", hl = { fg = palette.bg_third, bg = palette.bg } },
			right_sep = { "", hl = { fg = palette.bg_third, bg = palette.bg } },
			-- right_sep = { "", hl = { fg = palette.bg_third, bg = palette.bg } },
		},
		inactive_tab = {
			label = function(tabid)
				return {
					" " .. tabname(tabid) .. " ",
					hl = { fg = palette.fg_sec, bg = palette.bg_sec, style = "none" },
				}
			end,
			left_sep = { "", hl = { fg = palette.bg_sec, bg = palette.bg } },
			right_sep = { "", hl = { fg = palette.bg_sec, bg = palette.bg } },
			-- right_sep = { "", hl = { fg = palette.bg_sec, bg = palette.bg } },
		},
		top_win = {
			label = function(winid)
				return {
					bufname(winid) .. " ",
					hl = { fg = palette.accent_sec, bg = palette.bg_third },
					-- hl = { fg = palette.fg, bg = palette.bg_third },
				}
			end,
			left_sep = { "", hl = { fg = palette.bg_third, bg = palette.bg } },
			right_sep = { "", hl = { fg = palette.bg_third, bg = palette.bg } },
		},
		win = {
			label = function(winid)
				return {
					bufname(winid) .. " ",
					hl = { fg = palette.fg_sec, bg = palette.bg_sec },
				}
			end,
			left_sep = { "", hl = { fg = palette.bg_sec, bg = palette.bg } },
			right_sep = { "", hl = { fg = palette.bg_sec, bg = palette.bg } },
		},
		tail = {
			{ "", hl = { fg = palette.bg, bg = palette.bg } },
			-- { "  ", hl = { fg = palette.bg, bg = palette.accent } },
		},
	}
	require("tabby").setup({ tabline = line })
end

function M.map() end

return M
