local M = {}

function M.config()
	local action = require("vfiler/action")
	-- window picker hook filter
	require("vfiler/action").setup({
		hook = {
			filter_choose_window = function(winids)
				return vim.tbl_filter(function(winid)
					local buffer = vim.api.nvim_win_get_buf(winid)
					local buffer_filetype = vim.api.nvim_buf_get_option(buffer, "filetype")
					local exclude_filetypes = {
						"incline",
						"vfiler",
					}
					local is_choosable = true
					for _, exclude_filetype in pairs(exclude_filetypes) do
						-- don't include exclude_filetypes' window
						is_choosable = exclude_filetype ~= buffer_filetype
						if not is_choosable then
							break
						end
					end
					return is_choosable
				end, winids)
			end,
		},
	})
	-- options
	require("vfiler/config").setup({
		options = {
			auto_cd = true,
			auto_resize = true,
			columns = "indent,icon,devicons,name,git,mode,size,time",
			header = true,
			keep = false,
			listed = false,
			name = "",
			session = "share",
			show_hidden_files = true,
			sort = "name",
			layout = "tab",
			width = 90,
			height = 30,
			new = false,
			quit = true,
			row = 0,
			col = 0,
			blend = 0,
			border = "rounded",
			zindex = 200,
			git = {
				enabled = true,
				ignored = false,
				untracked = true,
			},
			preview = {
				layout = "floating",
				width = 0,
				height = 0,
			},
		},

		mappings = {
			["."] = action.toggle_show_hidden,
			["<BS>"] = action.change_to_parent,
			["<C-l>"] = action.reload,
			["<C-p>"] = action.toggle_auto_preview,
			["<C-r>"] = action.sync_with_current_filer,
			["<C-s>"] = action.toggle_sort,
			["<CR>"] = action.open,
			-- ["<CR>"] = function(vfiler, context, view)
			-- 	action.open(vfiler, context, view)
			-- 	action.quit(vfiler, context, view)
			-- end,
			["<S-Space>"] = function(vfiler, context, view)
				action.toggle_select(vfiler, context, view)
				action.move_cursor_up(vfiler, context, view)
			end,
			-- ["<Space>"] = function(vfiler, context, view)
			-- 	action.toggle_select(vfiler, context, view)
			-- 	action.move_cursor_down(vfiler, context, view)
			-- end,
			require("vfiler/config").unmap("<Space>"),
			["<C-n>"] = function(vfiler, context, view)
				action.toggle_select(vfiler, context, view)
				action.move_cursor_down(vfiler, context, view)
			end,
			["<Tab>"] = action.switch_to_filer,
			["~"] = action.jump_to_home,
			["*"] = action.toggle_select_all,
			["\\"] = action.jump_to_root,
			["cc"] = action.copy_to_filer,
			["dd"] = action.delete,
			["gg"] = action.move_cursor_top,
			["b"] = action.list_bookmark,
			["h"] = action.close_tree_or_cd,
			["j"] = action.loop_cursor_down,
			["k"] = action.loop_cursor_up,
			["l"] = action.open_tree,
			["mm"] = action.move_to_filer,
			["p"] = action.toggle_preview,
			["q"] = action.quit,
			["<C-e>"] = action.quit,
			["<C-q>"] = function(vfiler, context, view)
				action.quit(vfiler, context, view)
				require("project_nvim.project").on_buf_enter() -- set cwd to ProjectRoot
			end,
			["r"] = action.rename,
			["s"] = action.open_by_split,
			["t"] = action.open_by_tabpage,
			["v"] = action.open_by_vsplit,
			["x"] = action.execute_file,
			["f"] = require("telescope.builtin").fd,
			["F"] = require("telescope.builtin").live_grep,
			["yy"] = action.yank_path,
			["B"] = action.add_bookmark,
			["C"] = action.copy,
			["D"] = action.delete,
			["G"] = action.move_cursor_bottom,
			["J"] = action.jump_to_directory,
			["K"] = action.new_directory,
			-- ["L"] = action.switch_to_drive,
			require("vfiler/config").unmap("L"),
			["M"] = action.move,
			["N"] = action.new_file,
			["P"] = action.paste,
			["S"] = action.change_sort,
			["U"] = action.clear_selected_all,
			["YY"] = action.yank_name,
		},
	})
end

function M.map()
	-- nnoremap(
	-- 	"<C-e>",
	-- 	":VFiler -auto-cd -keep -layout=left -width=30 -columns=indent,icon,devicons,name,git<CR>",
	-- 	{ noremap = true, silent = true }
	-- )
	nnoremap("R", ":VFiler -auto-cd -layout=none -session=buffer<CR>", { noremap = true, silent = true })
end
return M
