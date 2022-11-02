-- optimize loading
local has_impatient = pcall(require, "impatient")
if has_impatient then
	require("impatient").enable_profile()
end

require("options")
require("plugins-config")
require("lsp")
require("mappings")
