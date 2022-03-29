local M = {}

function M.map()
    vim.keymap.set("n", "S", "<cmd>FuzzyMotion<CR>", { noremap = false })
end

return M
