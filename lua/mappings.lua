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
-- -- now using export-to-vscode.nvim
-- vim.api.nvim_create_user_command("OpenVSCode", "!code .", {})

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

-- tab manipulation
vim.keymap.set("n", "<C-t>", ":$tabnew<CR>", { noremap = true })
vim.keymap.set("n", "<leader>tc", ":tabclose<CR>", { noremap = true })
vim.keymap.set("n", "<leader>to", ":tabonly<CR>", { noremap = true })
vim.keymap.set("n", "<Tab>", ":tabn<CR>", { noremap = true })
vim.keymap.set("n", "<S-Tab>", ":tabp<CR>", { noremap = true })
-- move current tab to previous position
vim.keymap.set("n", "<leader>tmp", ":-tabmove<CR>", { noremap = true })
-- move current tab to next position
vim.keymap.set("n", "<leader>tmn", ":+tabmove<CR>", { noremap = true })

-- open help for subject under cursor
vim.keymap.set("n", "<C-h>", "K", { noremap = true })
vim.keymap.set("x", "<C-h>", "K", { noremap = true })
vim.o.keywordprg = ":help"

-- ╭──────────────────────────────────────────────────────────╮
-- │                   textobject mappings                    │
-- ╰──────────────────────────────────────────────────────────╯
local function basic_text_objects()
	local chars = {
		"_",
		-- ".",
		":",
		",",
		";",
		"|",
		"/",
		"\\",
		"*",
		"+",
		"%",
		"`",
		"?",
	}
	for _, char in ipairs(chars) do
		for _, mode in ipairs({ "x", "o" }) do
			vim.keymap.set(
				mode,
				"i" .. char,
				string.format(":<C-u>silent! normal! f%sF%slvt%s<CR>", char, char, char),
				{ noremap = true, silent = true }
			)
			vim.keymap.set(
				mode,
				"a" .. char,
				string.format(":<C-u>silent! normal! f%sF%svf%s<CR>", char, char, char),
				{ noremap = true, silent = true }
			)
		end
	end
end
basic_text_objects()
-- whole line
vim.keymap.set({ "x", "o" }, "il", ":<C-u>silent! normal! $v^<CR>", { noremap = true, silent = true })
vim.keymap.set({ "x", "o" }, "al", ":<C-u>silent! normal! $v0<CR>", { noremap = true, silent = true })
