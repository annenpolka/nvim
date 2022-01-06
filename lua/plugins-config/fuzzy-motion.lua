local M = {}

function M.map()
    vim.api.nvim_set_keymap("n", "S", "<cmd>FuzzyMotion<CR>", { noremap = false })
end

return M
