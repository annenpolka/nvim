--Vim Keybindings--------------------------------------------------------------------------
-- Map jk Escape
vim.api.nvim_set_keymap("i", "jk", "<esc>", { noremap = true })

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

--Plugin Keybindings-----------------------------------------------------------------------
-- require plugin's mappings function
local m = function(name)
	return string.format("plugins-config.%s", name)
end

-- plugins
require(m("bufferline")).map()
require(m("gestures")).map()
require(m("telescope")).map()
require(m("nvim-tree")).map()
require(m("spectre")).map()
require(m("neogit")).map()
require(m("fuzzy-motion")).map()
require(m("kommentary")).map()
require(m("hlslens")).map()
require(m("trouble")).map()
require(m("focus")).map()
require(m("sayonara")).map()