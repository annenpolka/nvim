local M = {}

function M.config()
	vim.cmd([[
            imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")
            let g:copilot_no_tab_map = v:true
            let b:copilot_enabled = v:true
  ]])
end

return M
