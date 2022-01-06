-- Copy to system clipboard
vim.o.clipboard = "unnamedplus"

-- autoread
vim.g.autoread = true

-- Show cursorline
vim.wo.cursorline = true

--Set highlight on search
vim.o.hlsearch = true

--Make line numbers default
vim.wo.number = true

--Enable mouse mode
vim.o.mouse = "a"

--Enable break indent
vim.o.breakindent = true

-- Tab indent settings
vim.bo.tabstop = 2
vim.bo.shiftwidth = 2
vim.bo.expandtab = true -- replace TAB char to spaces
vim.bo.autoindent = true
vim.bo.smartindent = true

--Save undo history
vim.opt.undofile = true

--Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

--Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = "yes"

-- folding settings
vim.wo.foldcolumn = "1" -- visualize folding by column
vim.wo.foldenable = false -- no auto folding
vim.wo.foldlevel = 999 -- don't fold everything
vim.wo.foldnestmax = 3
vim.wo.foldminlines = 3
vim.wo.foldtext =
	[[substitute(getline(v:foldstart),'\\t',repeat('\ ',&tabstop),'g').'...'.trim(getline(v:foldend)) . ' (' . (v:foldend - v:foldstart + 1) . ' lines)']]
-- -- treesitter expr based folding
vim.wo.foldmethod = "expr"
vim.wo.foldexpr = "nvim_treesitter#foldexpr()"

-- Set completeopt to have a better completion experience
vim.o.completeopt = "menuone,noselect"
--
vim.o.termguicolors = true

---------------------------------------------------------------------------
-- Highlight on yank
vim.cmd([[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]])

-- quickfix autocmd
vim.cmd([[
  augroup QfAutoCommands
    autocmd!
    autocmd QuickfixCmdPost make,vimgrep cwindow " autoopen Quickfix
    autocmd WinEnter * if (winnr('$') == 1) && (getbufvar(winbufnr(0), '&buftype')) == 'quickfix' | quit | endif " autoclose when quit
  augroup end]])
