local tasks = {}
-- require defined custom tasks
for _, task_path in ipairs(vim.api.nvim_get_runtime_file("lua/overseer/template/user/*.lua", true)) do
	local task = vim.fn.fnamemodify(task_path, ":t:r")
	-- don't add init.lua as task
	if task ~= "init" then
		local module_name = "user." .. task
		table.insert(tasks, module_name)
	end
end

return tasks
