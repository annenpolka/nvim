local M = {}
function M.config()
	vim.fn["ddu#custom#patch_global"]({
		ui = "ff",
		volatile = false,
		uiParams = {
			ff = {
				startFilter = true,
				autoAction = { name = "preview" },
				winHeight = 25,
				-- previewHeight = 20,
				previewWidth = 80,
				previewVertical = true,
				-- split = "floating",
				-- floatingBorder = "single",
			},
		},
		sources = {
			-- { name = "file_rec", params = {} },
			{ name = "file_external", params = {} },
			{ name = "mr", params = { kind = "mrr" } },
			-- { name = "rg", params = { matchers = {} } },
			-- { name = "buffer", params = {} },
			{ name = "mr", params = { kind = "mrw" } },
			-- { name = "line", params = {} },
		},
		sourceParams = {
			file_external = {
				cmd = {
					"fd",
					".",
					"-H",
					"-E",
					".git/",
					"-t",
					"f",
				},
			},
			file_rec = {
				ignoredDirectories = {
					".git",
					".vscode-server",
					".cache",
				},
			},
			rg = {
				args = { "--column", "--no-heading", "--color", "never", "--json" },
			},
		},
		sourceOptions = {
			["_"] = {
				matchers = { "matcher_fzf" },
				ignoreCase = true,
				-- columns = { "filename" },
			},
			-- mr = {
			-- 	columns = { "filename" },
			-- },
		},
		kindOptions = {
			file = {
				defaultAction = "open",
			},
			word = {
				defaultAction = "append",
			},
			action = {
				defaultAction = "do",
			},
		},
	})
	-- ftplugin for ddu buffers
	local group = vim.api.nvim_create_augroup("DduKeymap", { clear = true })
	vim.api.nvim_create_autocmd("FileType", {
		group = group,
		pattern = "ddu-ff",
		callback = function()
			require("plugins-config.ddu").ftplugin_ddu_ff()
		end,
		desc = "Set key mappings in ddu-ff buffers",
	})
	vim.api.nvim_create_autocmd("FileType", {
		group = group,
		pattern = "ddu-ff-filter",
		callback = function()
			require("plugins-config.ddu").ftplugin_ddu_ff_filter()
			require("cmp").setup.buffer({ enabled = false })
		end,
		desc = "Set key mappings in ddu-ff-filter buffers",
	})

	vim.api.nvim_create_autocmd("FileType", {
		group = group,
		pattern = "ddu-filer",
		callback = function()
			require("plugins-config.ddu").ftplugin_ddu_filer()
		end,
		desc = "Set key mappings in ddu-filer buffers",
	})
end

function M.map()
	-- vim.keymap.set("n", "<leader><space>", "<Cmd>FocusDisable<CR>" .. "<Cmd>Ddu<CR>" .. "<Cmd>FocusEnable<CR>")
	require("plugins-config.focus").keymap_set("n", "<leader><space>", "<Cmd>Ddu<CR>", { silent = true })
end

-- ╭──────────────────────────────────────────────────────────╮
-- │           --- Settings in ddu-ff-filter buffer           │
-- ╰──────────────────────────────────────────────────────────╯
function M.ftplugin_ddu_ff()
	local opts = { buffer = true }
	vim.keymap.set("n", "<CR>", "<Cmd>call ddu#ui#ff#do_action('itemAction')<CR>", opts)
	vim.keymap.set("n", "<Space>", "<Cmd>call ddu#ui#ff#do_action('toggleSelectItem')<CR>", opts)
	vim.keymap.set("n", "<Tab>", "<Cmd>call ddu#ui#ff#do_action('chooseAction')<CR>", opts)
	vim.keymap.set("n", "<C-l>", "<Cmd>call ddu#ui#ff#do_action('refreshItems')<CR>", opts)
	-- vim.keymap.set("n", "i", "<Cmd>call ddu#ui#ff#do_action('openFilterWindow')<CR>", opts)
	vim.keymap.set("n", "p", "<Cmd>call ddu#ui#ff#do_action('preview')<CR>", opts)
	vim.keymap.set("n", "q", "<Cmd>call ddu#ui#ff#do_action('quit')<CR>", opts)
	vim.keymap.set("n", "<C-q>", "<Cmd>call ddu#ui#ff#do_action('quit')<CR>", opts)
	vim.keymap.set("n", "<C-g>", "<Cmd>call ddu#ui#ff#do_action('quit')<CR>", opts)
	-- vim.keymap.set("n", "c", "<Cmd>call ddu#ui#ff#do_action('itemAction', {'name': 'cd'})<CR>", opts)
	-- vim.keymap.set("n", "d", "<Cmd>call ddu#ui#ff#do_action('itemAction', {'name': 'delete'})<CR>", opts)
	-- vim.keymap.set("n", "e", "<Cmd>call ddu#ui#ff#do_action('itemAction', {'name': 'edit'})<CR>", opts)
	-- vim.keymap.set(
	-- 	"n",
	-- 	"E",
	-- 	"<Cmd>call ddu#ui#ff#do_action('itemAction', {'params': eval(input('params: '))})<CR>",
	-- 	opts
	-- )
	vim.keymap.set(
		"n",
		"s",
		"<Cmd>call ddu#ui#ff#do_action('itemAction', {'name': 'open', 'params': {'command': 'split'}})<CR>",
		opts
	)
	vim.keymap.set(
		"n",
		"v",
		"<Cmd>call ddu#ui#ff#do_action('itemAction', {'name': 'open', 'params': {'command': 'vsplit'}})<CR>",
		opts
	)
	vim.keymap.set(
		"n",
		"t",
		"<Cmd>call ddu#ui#ff#do_action('itemAction', {'name': 'open', 'params': {'command': 'tabnew'}})<CR>",
		opts
	)
	-- vim.keymap.set("n", "N", "<Cmd>call ddu#ui#ff#do_action('itemAction', {'name': 'new'})<CR>", opts)
	-- vim.keymap.set("n", "r", "<Cmd>call ddu#ui#ff#do_action('itemAction', {'name': 'quickfix'})<CR>", opts)
	-- vim.keymap.set(
	-- 	"n",
	-- 	"u",
	-- 	"<Cmd>call ddu#ui#ff#do_action('updateOptions', {'sourceOptions': {'_': {'matchers': }}})<CR>",
	-- 	opts
	-- )
end

--- Settings in ddu-ff-filter buffer
function M.ftplugin_ddu_ff_filter()
	local opts = { silent = true, buffer = true }
	vim.keymap.set("i", "<CR>", "<Esc><Cmd>call ddu#ui#ff#close()<CR>", opts)
	-- vim.keymap.set("i", "jj", "<Esc><Cmd>call ddu#ui#ff#close()<CR>", opts)
	vim.keymap.set("n", "<CR>", "<Cmd>call ddu#ui#ff#close()<CR>", opts)
	vim.keymap.set("n", "q", "<Cmd>call ddu#ui#ff#close()<CR>", opts)
	vim.keymap.set("n", "j", "<Cmd>call ddu#ui#ff#close()<CR>", opts)
	vim.keymap.set("n", "k", "<Cmd>call ddu#ui#ff#close()<CR>", opts)
	vim.keymap.set(
		{ "i", "n" },
		"<C-q>",
		"<Cmd>call ddu#ui#ff#close()<CR><Cmd>call ddu#ui#ff#do_action('quit')<CR>",
		opts
	)
	vim.keymap.set(
		{ "i", "n" },
		"<C-g>",
		"<Cmd>call ddu#ui#ff#close()<CR><Cmd>call ddu#ui#ff#do_action('quit')<CR>",
		opts
	)
end

--- Settings in ddu-filer buffer
function M.ftplugin_ddu_filer()
	vim.keymap.set("n", "q", "<Cmd>call ddu#ui#filer#do_action('quit')<CR>", { buffer = true })
	vim.keymap.set("n", "<CR>", function()
		if vim.fn["ddu#ui#filer#is_directory"]() then
			vim.fn["ddu#ui#do_action"]("itemAction", { name = "narrow" })
		else
			vim.fn["ddu#ui#do_action"]("itemAction", { name = "open" })
		end
	end, { buffer = true, expr = true })
end

return M
