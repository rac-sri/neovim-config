return {
	"volskaya/windovigation.nvim",
	lazy = false,
	opts = {
		keymaps = {
			bracket_movement_key = "b", -- [b and ]b for navigation
			buffer_close_key = "k", -- <leader>bk to close
		},
	},
	config = function(_, opts)
		require("windovigation").setup(opts)

		local navigate = require("windovigation.actions")

		-- Override global buffer navigation keys with window-local ones
		local map = vim.keymap.set
		local desc = { noremap = true, silent = true }

		-- Custom cyclic navigation functions
		local function cycle_next()
			if not navigate.move_to_next_file() then
				navigate.move_to_first_file()
			end
		end

		local function cycle_prev()
			if not navigate.move_to_previous_file() then
				navigate.move_to_last_file()
			end
		end

		-- Next/Prev buffer (Cyclic)
		map("n", "<Tab>l", cycle_next, vim.tbl_extend("force", desc, { desc = "Next buffer (local cyclic)" }))
		map("n", "<Tab>h", cycle_prev, vim.tbl_extend("force", desc, { desc = "Prev buffer (local cyclic)" }))

		-- Close buffer
		map("n", "<leader>x", function()
			navigate.close_current_file()
		end, vim.tbl_extend("force", desc, { desc = "Close buffer (local)" }))
	end,
}
