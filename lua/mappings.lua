--Vim Keybindings--------------------------------------------------------------------------
-- Map jk Escape
-- now using better-escape.nvim
-- vim.keymap.set("i", "jk", "<esc>", { noremap = true })

--Save with <c-s>
vim.keymap.set("n", "<c-s>", "<cmd>w<CR>", { noremap = true, silent = true })
vim.keymap.set("i", "<c-s>", "<esc><cmd>w<CR>", { noremap = true, silent = true })

-- -- fold/unfold
vim.keymap.set("n", "<c-j>", "zo", { noremap = true, silent = true })
vim.keymap.set("n", "<c-k>", "zc", { noremap = true, silent = true })

--Remap space as leader key
vim.keymap.set("", "<Space>", "<Nop>", { noremap = true, silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

--Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true })

-- go forward/previous position
-- vim.keymap.set("n", "H", "<C-o>", { noremap = true, silent = true })
-- vim.keymap.set("n", "L", "<C-i>", { noremap = true, silent = true })

-- <C-j>/<C-k> moves selected lines down/up in visual mode
vim.keymap.set("x", "<C-j>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set("x", "<C-K>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

-- Open VSCode
-- vim.keymap.set("n", "<F5>", ":!code .<CR>", { noremap = true, silent = true })
vim.api.nvim_create_user_command("OpenVSCode", "!code .", {})

-- disable default <C-c> behaviour
nnoremap("<C-c>", "<Nop>")

-- open commandline buffer
nnoremap("<leader>cc", "q:")

-- bnext/bprev
vim.keymap.set("n", "^", ":bnext<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "-", ":bprev<CR>", { noremap = true, silent = true })

-- noautocmd on macro execution
vim.keymap.set("n", "@", [[<cmd>execute "noautocmd norm! " . v:count1 . "@" . getcharstr()<cr>]], { noremap = true })
vim.keymap.set(
	"x",
	"@",
	[[:<C-U>execute "noautocmd '<,'>norm! " . v:count1 . "@" . getcharstr()<cr>]],
	{ noremap = true }
)

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
	-- require(m("sayonara")).map()
	-- require(m("spectre")).map()
	-- require(m("symbols-outline")).map()
	-- require(m("telescope")).map()
	-- require(m("todo-comments")).map()
	-- require(m("trouble")).map()
	-- require(m("vim-bookmarks")).map()
	-- require(m("vim-ctrlspace")).map()
	-- require(m("twilight")).map()
	-- require(m("neoroot")).map()
	-- require(m("comment-box")).map()
	-- require(m("zen-mode")).map()
	-- require(m("nvim-treehopper")).map()
	-- require(m("dirbuf")).map()
	-- require(m("aerial")).map()
	-- require(m("mundo")).map()
	-- require(m("dap")).map()
end
-- map_plugins()
