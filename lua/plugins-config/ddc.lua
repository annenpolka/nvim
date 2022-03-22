local M = {}

function M.config()
	vim.fn["popup_preview#enable"]()
	vim.fn["ddc#enable"]()
	vim.fn["ddc#custom#patch_global"]({
		backspaceCompletion = true,
		autoCompleteDelay = 100,
		autocompleteEvents = {
			"InsertEnter",
			"TextChangedI",
			"TextChangedP",
			"CmdlineEnter",
			"CmdlineChanged",
		},
		completionMenu = "pum.vim",
		sources = { "nvim-lsp", "vsnip", "around", "buffer", "file" },
		sourceOptions = {
			["_"] = {
				matchers = { "matcher_fuzzy" },
				sorters = { "sorter_fuzzy" },
				converters = { "converter_fuzzy" },
			},
			["nvim-lsp"] = {
				mark = "LS",
				maxCandidates = 10,
				forceCompletionPattern = [[\.\w*|:\w*|->\w*]],
			},
			vsnip = {
				mark = "S",
				maxCandidates = 5,
			},
			around = {
				mark = "A",
				maxCandidates = 3,
			},
			buffer = {
				mark = "B",
				maxCandidates = 3,
			},
			file = {
				mark = "F",
				isVolatile = true,
				maxCandidates = 5,
				forceCompletionPattern = [[\S/\S*]],
			},
		},
		-- TODO: fix this to ddc-way(not working now)
		sourceParams = {
			kindLabels = {
				Class = "ﴯ Class",
				Color = " Color",
				Constant = " Cons",
				Constructor = " New",
				Enum = " Enum",
				EnumMember = " Enum",
				Event = " Event",
				Field = "ﰠ Field",
				File = " File",
				Folder = " Dir",
				Function = " Fun",
				Interface = " Int",
				Keyword = " Key",
				Method = " Method",
				Module = " Mod",
				Operator = " Op",
				Property = "ﰠ Prop",
				Reference = " Ref",
				Snippet = " Snip",
				Struct = "פּ Struct",
				Text = " Text",
				TypeParameter = "",
				Unit = "塞 Unit",
				Value = " Value",
				Variable = " Var",
			},
		},
	})
	local group = vim.api.nvim_create_augroup("ddc_initialize", { clear = true })
	local autocmd = vim.api.nvim_create_autocmd
	autocmd("User PumCompleteDone", {
		desc = "vsnip-integration",
		callback = function()
			vim.fn["vsnip_integ#on_complete_done"](vim.g["pum#completed_item"])
		end,
		group = group,
	})
end

function M.map()
	inoremap(
		"<TAB>",
		[[pum#visible() ? '<Cmd>call pum#map#insert_relative(+1)<CR>' : (col('.') <= 1 <Bar><Bar> getline('.')[col('.') - 2] =~# '\s') ? '<TAB>' : ddc#manual_complete()]],
		{ silent = true, expr = true }
	)
	inoremap("<S-Tab>", [[<Cmd>call pum#map#insert_relative(-1)<CR>]])
	inoremap("<C-n>", [[<Cmd>call pum#map#insert_relative(+1)<CR>]])
	inoremap("<C-p>", [[<Cmd>call pum#map#insert_relative(-1)<CR>]])
	inoremap("<C-y>", [[<Cmd>call pum#map#confirm()<CR>]])
	inoremap("<CR>", [[pum#visible() ? '<Cmd>call pum#map#confirm()<CR>' : '<CR>']], { silent = true, expr = true })
	inoremap("<C-e>", [[<Cmd>call pum#map#cancel()<CR>]])
	nnoremap(":", "<Cmd>lua require'plugins-config.ddc'.commandlinePre()<CR>:")
end

-- store buffer config for commandline completion
M.prev_buffer_config = nil
-- enable commandline completion hook
function M.commandlinePre()
	cnoremap(
		"<TAB>",
		[[pum#visible() ? '<Cmd>call pum#map#insert_relative(+1)<CR>' : (col('.') <= 1 <Bar><Bar> getline('.')[col('.') - 2] =~# '\s') ? '<TAB>' : ddc#manual_complete()]],
		{ silent = true, expr = true }
	)
	cnoremap("<S-Tab>", [[<Cmd>call pum#map#insert_relative(-1)<CR>]])
	cnoremap("<C-y>", [[<Cmd>call pum#map#confirm()<CR>]])
	cnoremap("<C-e>", [[<Cmd>call pum#map#cancel()<CR>]])
	M.prev_buffer_config = vim.fn["ddc#custom#get_buffer"]()
	vim.fn["ddc#enable_cmdline_completion"]()
	-- vim.fn["ddc#enable"]()
	--autocmd for calling post hook
	local group = vim.api.nvim_create_augroup("ddc_commandline", { clear = true })
	local autocmd = vim.api.nvim_create_autocmd
	autocmd("User DDCCmndlineLeave", {
		desc = "end comnandline completion",
		callback = function()
			M.commandlinePost()
		end,
		group = group,
		once = true,
	})
end
-- restore buffer config hook
function M.commandlinePost()
	vim.fn["ddc#custom#set_buffer"](M.prev_buffer_config)
	vim.api.nvim_del_keymap("c", "<Tab>")
end

return M
