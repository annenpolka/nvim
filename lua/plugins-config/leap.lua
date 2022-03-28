local M = {}

function M.config()
	require("leap").setup({
		case_insensitive = true,
		-- Leaving the appropriate list empty effectively disables "smart" mode,
		-- and forces auto-jump to be on or off.
		-- safe_labels = { . . . },
		-- labels = { . . . },
		-- These keys are captured directly by the plugin at runtime.
		special_keys = {
			["next_match_group"] = "<space>",
			["prev_match_group"] = "<tab>",
			["repeat"] = "<enter>",
			["revert"] = "<tab>",
		},
	})
end

function M.map()
	nmap("J", "<Plug>(leap-forward)", "silent")
	nmap("K", "<Plug>(leap-backward)", "silent")
	local function set_leap_repeat_keys(repeat_key, revert_key)
		local sk = require("leap").opts.special_keys

		local function switch()
			local temp = sk["repeat"]
			sk["repeat"] = sk["revert"]
			sk["revert"] = temp
		end

		sk["repeat"] = repeat_key
		sk["revert"] = revert_key
		vim.keymap.set({ "n", "x" }, repeat_key, ("<Plug>(leap-forward)" .. repeat_key))
		vim.keymap.set({ "n", "x" }, revert_key, function()
			vim.g.reverse_leap = true
			return ("<Plug>(leap-backward)" .. revert_key)
		end, { expr = true })

		vim.api.nvim_create_augroup("LeapCustom", {})
		vim.api.nvim_create_autocmd("User", {
			pattern = "LeapEnter",
			group = "LeapCustom",
			callback = function()
				if vim.g.reverse_leap then
					switch()
				end
			end,
		})
		vim.api.nvim_create_autocmd("User", {
			pattern = "LeapLeave",
			group = "LeapCustom",
			callback = function()
				if vim.g.reverse_leap then
					switch()
					vim.g.reverse_leap = nil
				end
			end,
		})
	end
	set_leap_repeat_keys("<Enter>", "<S-Tab>")
end

return M
