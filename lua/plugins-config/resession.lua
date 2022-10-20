local M = {}

function M.config()
	local resession = require("resession")
	resession.setup({
		autosave = {
			enabled = true,
			interval = 30,
			notify = false,
		},
		-- Save and restore these options
		options = {
			"binary",
			"bufhidden",
			"buflisted",
			"cmdheight",
			"diff",
			"filetype",
			"modifiable",
			"previewwindow",
			"readonly",
			"scrollbind",
			"winfixheight",
			"winfixwidth",
		},
		-- Custom logic for determining if the buffer should be included
		buf_filter = require("resession").default_buf_filter,
		-- Custom logic for determining if a buffer should be included in a tab-scoped session
		tab_buf_filter = function(tabpage, bufnr)
			local dir = vim.fn.getcwd(-1, vim.api.nvim_tabpage_get_number(tabpage))
			return vim.startswith(vim.api.nvim_buf_get_name(bufnr), dir)
		end,
		-- The name of the directory to store sessions in
		dir = "session",
		-- Show more detail about the sessions when selecting one to load.
		-- Disable if it causes lag.
		load_detail = true,
		-- Configuration for extensions
		extensions = {
			quickfix = {},
		},
	})
	--  ╭──────────────────────────────────────────────────────────╮
	--  │               create session per directory               │
	--  ╰──────────────────────────────────────────────────────────╯
	vim.api.nvim_create_autocmd("VimLeavePre", {
		callback = function()
			resession.save(vim.fn.getcwd(), { dir = "session", notify = false })
		end,
	})

	-- vim.api.nvim_create_autocmd("TabLeave", {
	-- 	pattern = "*",
	-- 	callback = function()
	-- 		local filename = require("tabby.filename")
	-- 		local name = filename.unique(0)
	-- 		resession.save_tab(vim.fn.getcwd() .. "_" .. name, { dir = "session", notify = false })
	-- 	end,
	-- })
	--  ╭──────────────────────────────────────────────────────────╮
	--  │                         mappings                         │
	--  ╰──────────────────────────────────────────────────────────╯
	-- Resession does NOTHING automagically, so we have to set up some keymaps
	vim.keymap.set("n", "<leader>ss", resession.save_tab)
	vim.keymap.set("n", "<leader>sl", resession.load)
	vim.keymap.set("n", "<leader>sd", resession.delete)
end

return M
