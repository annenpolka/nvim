local M = {}

function M.config()
    -- nvim-lightbulb for all filetypes
    vim.cmd([[autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()]])
end

return M
