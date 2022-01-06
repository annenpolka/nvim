local M = {}

function M.config()
    require("toggleterm").setup({
    	open_mapping = [[<c-t>]],
    })
end

return M