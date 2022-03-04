--Vim Keybindings--------------------------------------------------------------------------
-- Map jk Escape
-- now using better-escape.nvim
-- vim.api.nvim_set_keymap("i", "jk", "<esc>", { noremap = true })

--Save with <c-s>
vim.api.nvim_set_keymap("n", "<c-s>", "<cmd>w<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<c-s>", "<esc><cmd>w<CR>", { noremap = true, silent = true })

-- -- fold/unfold
vim.api.nvim_set_keymap("n", "<c-j>", "zo", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<c-k>", "zc", { noremap = true, silent = true })

--Remap space as leader key
vim.api.nvim_set_keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

--Remap for dealing with word wrap
vim.api.nvim_set_keymap("n", "k", "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true })
vim.api.nvim_set_keymap("n", "j", "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true })

-- Shift + J/K moves selected lines down/up in visual mode
vim.api.nvim_set_keymap("v", "J", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "K", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

-- Open VSCode
-- vim.api.nvim_set_keymap("n", "<F5>", ":!code .<CR>", { noremap = true, silent = true })

-- disable default <C-c> behaviour
nnoremap("<C-c>", "<Nop>")

-- open commandline buffer
nnoremap("<leader>cc", "q:")

-- bnext/bprev
vim.api.nvim_set_keymap("n", "^", ":bnext<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "-", ":bprev<CR>", { noremap = true, silent = true })

vim.cmd([[
com! CheckHighlightUnderCursor echo {l,c,n ->
        \   'hi<'    . synIDattr(synID(l, c, 1), n)             . '> '
        \  .'trans<' . synIDattr(synID(l, c, 0), n)             . '> '
        \  .'lo<'    . synIDattr(synIDtrans(synID(l, c, 1)), n) . '> '
        \ }(line("."), col("."), "name")
]])

--Plugin Keybindings-----------------------------------------------------------------------
-- plugins
local function map_plugins()
	require("plugins-config.gesture").map()
	require("plugins-config.sayonara").map()
	require("plugins-config.neoroot").map()
	require("plugins-config.nredir").map()
	require("plugins-config.neogit").map()
	require("plugins-config.spectre").map()
	require("plugins-config.telescope").map()
	require("plugins-config.dirbuf").map()
	require("plugins-config.comment-box").map()
	require("plugins-config.vim-bookmarks").map()
	require("plugins-config.mundo").map()
	require("plugins-config.neoformat").map()
	require("plugins-config.tabby").map()
	require("plugins-config.twilight").map()
	require("plugins-config.nvim-treehopper").map()
	require("plugins-config.dap").map()
	require("plugins-config.hop").map()
	require("plugins-config.sandwich").map()
	require("plugins-config.kommentary").map()
	require("plugins-config.hlslens").map()
	require("plugins-config.todo-comments").map()
	require("plugins-config.trouble").map()
	require("plugins-config.harpoon").map()
	require("plugins-config.qf_helper").map()
	require("plugins-config.toggleterm").map()
	require("plugins-config.focus").map()
	require("plugins-config.zen-mode").map()
	require("plugins-config.yode").map()
end
map_plugins()
