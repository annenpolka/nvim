local M = {}

function M.config()
    -- Code Biscuits
    local biscuits = require("nvim-biscuits").setup({
    	toggle_keybind = "<leader>bs",
    	show_on_start = true,
    	cursor_line_only = false,
    	default_config = {
    		max_length = 120,
    		min_distance = 3,
    		prefix_string = "<- ",
    	},
    	language_config = {
    		python = {
    			disabled = true,
    		},
    	},
    })
end

return M