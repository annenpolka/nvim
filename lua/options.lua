-- ╭──────────────────────────────────────────────────────────╮
-- │                     global function                      │
-- ╰──────────────────────────────────────────────────────────╯
-- highlight
_G.set_highlight = function(...)
	vim.api.nvim_set_hl(0, ...)
end

--  ╭──────────────────────────────────────────────────────────╮
--  │                         options                          │
--  ╰──────────────────────────────────────────────────────────╯
-- Copy to system clipboard
vim.o.clipboard = "unnamedplus"

-- autoread
vim.g.autoread = true

-- split window behavior
vim.g.splitkeep = "screen"

-- virtualedit
vim.b.virtualedit = "block"

-- Show cursorline
vim.wo.cursorline = true
vim.wo.cursorcolumn = false

--Set highlight on search
vim.o.hlsearch = true

--Make line numbers default
vim.wo.number = true

-- show gutter signs on number column
vim.wo.signcolumn = "number"

--Enable mouse mode
vim.o.mouse = "a"

--Enable break indent
vim.o.breakindent = true

-- Tab indent settings
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true -- replace TAB char to spaces
vim.opt.autoindent = true
vim.opt.smartindent = true

--Save undo history
vim.opt.undofile = true

--Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

--Decrease update time
vim.o.updatetime = 300

-- folding settings
vim.wo.foldenable = false -- no auto folding
vim.wo.foldcolumn = "0" -- visualize folding by column
vim.wo.foldlevel = 999 -- don't fold everything
vim.wo.foldnestmax = 5
vim.wo.foldminlines = 2
vim.wo.foldtext =
	[[substitute(getline(v:foldstart),'\\t',repeat('\ ',&tabstop),'g').'...'.trim(getline(v:foldend)) . ' (' . (v:foldend - v:foldstart + 1) . ' lines)']]

-- Set completeopt to have a better completion experience
vim.o.completeopt = "menuone,noselect"

-- spellsuggest  of code
-- test: spell codeSpell CodeSpall
vim.opt.spell = true
vim.opt.spelllang = { "en_us", "programming", "cjk" }
vim.opt.spelloptions = vim.opt.spelloptions + "camel"
vim.opt.spellsuggest = { "best", 5 }

-- color terminal termiguicolors
vim.o.termguicolors = true

-- disable built-in plugins
local disabled_built_ins = {
	"2html_plugin",
	-- "filetypes",
	"getscript",
	"getscriptPlugin",
	"gzip",
	"logiPat",
	"matchparen",
	"netrw",
	"netrwPlugin",
	"netrwSettings",
	"netrwFileHandlers",
	-- "matchit",
	"tar",
	"tarPlugin",
	"rrhelper",
	"spellfile_plugin",
	"vimball",
	"vimballPlugin",
	"zip",
	"zipPlugin",
}

for _, plugin in pairs(disabled_built_ins) do
	vim.g["loaded_" .. plugin] = 1
end

---------------------------------------------------------------------------
-- Highlight on yank
-- vim.api.nvim_create_autocmd("TextYankPost", {
-- 	pattern = "*",
-- 	callback = function()
-- 		vim.highlight.on_yank({ timeout = 500 })
-- 	end,
-- })

-- quickfix autocmd
vim.cmd([[
  augroup QfAutoCommands
    autocmd!
    autocmd QuickfixCmdPost make,vimgrep cwindow " autoopen Quickfix
    " autocmd WinEnter * if (winnr('$') == 1) && (getbufvar(winbufnr(0), '&buftype')) == 'quickfix' | quit | endif " autoclose when quit
  augroup end]])

-- set formatoptions
-- HACK: formatoptions seems be overwritten by some plugin, so setting by autocmd
vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
	callback = function()
		vim.opt.formatoptions = vim.opt.formatoptions
			- "a" -- Auto formatting is BAD.
			- "t" -- Don't auto format my code. I got linters for that.
			+ "c" -- In general, I like it when comments respect textwidth
			+ "q" -- Allow formatting comments w/ gq
			- "o" -- O and o, don't continue comments
			-- + "r" -- But do continue when pressing enter.
			- "r"
			+ "n" -- Indent past the formatlistpat, not underneath it.
			+ "j" -- Auto-remove comments if possible.
			- "2" -- I'm not in gradeschool anymore
	end,
})
-- vim.opt.formatoptions = vim.opt.formatoptions
-- 	- "a" -- Auto formatting is BAD.
-- 	- "t" -- Don't auto format my code. I got linters for that.
-- 	+ "c" -- In general, I like it when comments respect textwidth
-- 	+ "q" -- Allow formatting comments w/ gq
-- 	- "o" -- O and o, don't continue comments
-- 	-- + "r" -- But do continue when pressing enter.
-- 	- "r"
-- 	+ "n" -- Indent past the formatlistpat, not underneath it.
-- 	+ "j" -- Auto-remove comments if possible.
-- 	- "2"

-- workaround dockerfile's filetype problem (set to `Dockerfile` by default)
vim.api.nvim_create_autocmd({ "BufEnter", "BufRead", "BufNewFile" }, {
	pattern = "dockerfile",
	callback = function()
		vim.cmd("setfiletype dockerfile")
	end,
})

-- start insert mode automatically when TermOpen
-- NOTE: this causes neogit start in instert mode
-- vim.api.nvim_create_autocmd({ "TermOpen" }, {
-- 	pattern = "*",
-- 	callback = function()
-- 		vim.cmd("startinsert")
-- 	end,
-- })
