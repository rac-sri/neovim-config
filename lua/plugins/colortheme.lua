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

		local apply_transparency = function()
			-- Base transparency
			vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
			vim.api.nvim_set_hl(0, "NormalNC", { bg = "NONE" })
			vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "NONE" })

			vim.opt.winblend = 0
			vim.opt.pumblend = 0

			-- Floating windows transparency
			vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
			vim.api.nvim_set_hl(0, "FloatNormal", { bg = "NONE" })
			vim.api.nvim_set_hl(0, "FloatBorder", { bg = "NONE", fg = "#4C566A" })

			-- LazyGit transparency
			vim.api.nvim_set_hl(0, "LazyGitFloat", { bg = "NONE" })
			vim.api.nvim_set_hl(0, "LazyGitBorder", { bg = "NONE", fg = "#4C566A" })

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

			vim.api.nvim_set_hl(0, "AlphaHeader", { fg = "#4fd1c5", bg = "NONE" })
		end

		-- 🔧 MINIMAL FIX: remove grey inactive background
		vim.api.nvim_create_autocmd("ColorScheme", {
			pattern = "nord",
			callback = apply_transparency,
		})

		-- Load the colorscheme
		require("nord").set()
		apply_transparency()

		vim.api.nvim_create_autocmd("TermOpen", {
			callback = function()
				if vim.bo.filetype == "lazygit" or vim.api.nvim_buf_get_name(0):find("lazygit") then
					vim.opt_local.winhighlight = "Normal:Normal,NormalFloat:Normal"
				else
					vim.opt_local.winhighlight = ""
				end
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