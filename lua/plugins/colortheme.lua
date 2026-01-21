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

				-- Floating windows transparency
				vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
				vim.api.nvim_set_hl(0, "FloatBorder", { bg = "NONE", fg = "#4C566A" })

				-- Avante transparency
				vim.api.nvim_set_hl(0, "AvanteTitle", { bg = "NONE", fg = "#81A1C1" })
				vim.api.nvim_set_hl(0, "AvanteSubtitle", { bg = "NONE", fg = "#88C0D0" })
				vim.api.nvim_set_hl(0, "AvanteInlineHint", { bg = "NONE", fg = "#5E81AC" })
				vim.api.nvim_set_hl(0, "AvanteConflictCurrent", { bg = "NONE", fg = "#BF616A" })
				vim.api.nvim_set_hl(0, "AvanteConflictIncoming", { bg = "NONE", fg = "#EBCB8B" })
				vim.api.nvim_set_hl(0, "AvantePrompt", { bg = "NONE" })
				vim.api.nvim_set_hl(0, "AvanteSuggestion", { bg = "NONE", fg = "#D8DEE9" })

				-- Telescope transparency
				vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "NONE" })
				vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "NONE", fg = "#4C566A" })
				vim.api.nvim_set_hl(0, "TelescopePromptNormal", { bg = "NONE" })
				vim.api.nvim_set_hl(0, "TelescopePromptBorder", { bg = "NONE", fg = "#4C566A" })
				vim.api.nvim_set_hl(0, "TelescopeResultsNormal", { bg = "NONE" })
				vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { bg = "NONE", fg = "#4C566A" })
				vim.api.nvim_set_hl(0, "TelescopePreviewNormal", { bg = "NONE" })
				vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { bg = "NONE", fg = "#4C566A" })

				-- Snacks transparency
				vim.api.nvim_set_hl(0, "SnacksNormal", { bg = "NONE" })
				vim.api.nvim_set_hl(0, "SnacksBorder", { bg = "NONE", fg = "#4C566A" })

				-- Dressing transparency
				vim.api.nvim_set_hl(0, "DressingSelectNormal", { bg = "NONE" })
				vim.api.nvim_set_hl(0, "DressingSelectBorder", { bg = "NONE", fg = "#4C566A" })
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
