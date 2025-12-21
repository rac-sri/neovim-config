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
		---------------------------------------------------------------------------
		-- OpenCode core options
		---------------------------------------------------------------------------
		vim.g.opencode_opts = {
			ui = {
				layout = "vertical",
				position = "right",
				width = 45,
				persistent = true,
				focus_on_open = true,
			},

			connection = {
				auto_connect = true,
				cwd_scope = true,
			},

			events = {
				reload = true,
			},
		}

		vim.o.autoread = true

		local oc = require("opencode")
		local snacks = require("snacks")

		---------------------------------------------------------------------------
		-- Avante-style keybindings
		---------------------------------------------------------------------------

		vim.keymap.set({ "n", "x" }, "<leader>aa", function()
			oc.ask("@this ")
		end, { desc = "OpenCode: open sidebar + ask" })

		-- Inline ask only (no sidebar)
		vim.keymap.set({ "n", "x" }, "<leader>ai", function()
			oc.ask("@this ")
		end, { desc = "OpenCode: inline ask" })

		-- Toggle sidebar only
		vim.keymap.set("n", "<leader>ap", function()
			oc.toggle()
		end, { desc = "OpenCode: toggle panel" })

		-- Action / command picker (with sidebar)
		vim.keymap.set("n", "<leader>ac", function()
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

		---------------------------------------------------------------------------
		-- OpenCode buffer-local UX
		---------------------------------------------------------------------------

		vim.api.nvim_create_autocmd("FileType", {
			pattern = "opencode",
			callback = function()
				vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = true })
				vim.keymap.set("n", "<CR>", function()
					oc.command("submit")
				end, { buffer = true, desc = "OpenCode: submit" })
			end,
		})
	end,
}
