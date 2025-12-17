return {
	"shaunsingh/nord.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		vim.g.nord_contrast = true
		vim.g.nord_borders = false
		vim.g.nord_disable_background = true
		vim.g.nord_italic = false
		vim.g.nord_uniform_diff_background = true
		vim.g.nord_bold = false

		-- Load the colorscheme
		require("nord").set()

		-- 🔧 MINIMAL FIX: remove grey inactive background
		vim.api.nvim_create_autocmd("ColorScheme", {
			pattern = "nord",
			callback = function()
				vim.api.nvim_set_hl(0, "NormalNC", { bg = "NONE" })
				vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "NONE" })
			end,
		})

		vim.api.nvim_create_autocmd("TermOpen", {
			callback = function()
				vim.opt_local.winhighlight = ""
			end,
		})

		-- Toggle background transparency
		local bg_transparent = true
		local toggle_transparency = function()
			bg_transparent = not bg_transparent
			vim.g.nord_disable_background = bg_transparent
			vim.cmd([[colorscheme nord]])
		end

		vim.keymap.set("n", "<leader>bg", toggle_transparency, { silent = true })
	end,
}
