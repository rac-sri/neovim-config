return {
	"NickvanDyke/opencode.nvim",
	dependencies = {
		{
			"folke/snacks.nvim",
			opts = {
				input = {},
				picker = {},
				terminal = {},
			},
		},
	},

	config = function()
		vim.g.opencode_opts = {
			ui = {
				layout = "vertical",
				position = "right",
				width = 45,
				persistent = true,
				focus_on_open = true,
			},

			provider = {
				snacks = {
					win = {
						wo = {
							winhighlight = "",
						},
					},
				},
			},

			connection = {
				auto_connect = true,
				cwd_scope = true,
			},

			events = {
				reload = true,
			},
		}
		-- Enable automatic reloading of buffers when files change
		vim.o.autoread = true

		local oc = require("opencode")
		--
		---------------------------------------------------------------------------
		-- Avante-style keybindings
		---------------------------------------------------------------------------

		-- Inline ask only (no sidebar)
		vim.keymap.set({ "n", "x" }, "<leader>oi", function()
			oc.ask("@this ")
		end, { desc = "OpenCode: inline ask" })

		-- Toggle sidebar only
		vim.keymap.set("n", "<leader>op", function()
			oc.toggle()
		end, { desc = "OpenCode: toggle panel" })

		-- Action / command picker (with sidebar)
		vim.keymap.set("n", "<leader>oc", function()
			oc.select()
		end, { desc = "OpenCode: action picker" })

		---------------------------------------------------------------------------
		-- Vim-style operators (ranges + dot-repeat)
		---------------------------------------------------------------------------

		vim.keymap.set("n", "go", function()
			return oc.operator("@this ")
		end, { expr = true, desc = "OpenCode: add range" })

		vim.keymap.set("n", "goo", function()
			return oc.operator("@this ") .. "_"
		end, { expr = true, desc = "OpenCode: add line" })
	end,
}
