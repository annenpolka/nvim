local M = {}

M.exec_path = table.concat({ vim.fn.stdpath("data"), "/mason/bin/" })

function M.file_exists(name)
	local f = io.open(name, "r")
	if f ~= nil then
		io.close(f)
		return true
	else
		return false
	end
end

return M
