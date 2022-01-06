local M = {}

function M.config()
    -- Replace notify with nvim-notify
    vim.notify = require("notify")
end

return M