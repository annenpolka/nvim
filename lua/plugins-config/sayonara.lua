local M = {}

function M.map()
    vim.api.nvim_set_keymap("n", "<leader>Q", ":Sayonara<CR>", { silent = true })
end

return M
