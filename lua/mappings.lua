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

--Plugin Keybindings-----------------------------------------------------------------------
-- require plugin's mappings function
local m = function(name)
	return string.format("plugins-config.%s", name)
end

-- plugins
local function map_plugins()
	-- require(m("bufferline")).map()
	-- require(m("tabby")).map()
	-- require(m("focus")).map()
	-- require(m("gesture")).map()
	-- require(m("harpoon")).map()
	-- require(m("hlslens")).map()
	-- require(m("kommentary")).map()
	-- require(m("neogit")).map()
	-- require(m("nvim-tree")).map()
	-- require(m("pounce")).map()
	-- require(m("hop")).map()
	-- require(m("qf_helper")).map()
	-- require(m("sandwich")).map()
	require(m("sayonara")).map()
	-- require(m("spectre")).map()
	-- require(m("symbols-outline")).map()
	require(m("telescope")).map()
	-- require(m("todo-comments")).map()
	-- require(m("trouble")).map()
	require(m("vim-bookmarks")).map()
	-- require(m("vim-ctrlspace")).map()
	require(m("twilight")).map()
	require(m("neoroot")).map()
	require(m("comment-box")).map()
	require(m("zen-mode")).map()
	-- require(m("nvim-treehopper")).map()
	require(m("dirbuf")).map()
	-- require(m("aerial")).map()
	require(m("mundo")).map()
	-- require(m("dap")).map()
end
map_plugins()
