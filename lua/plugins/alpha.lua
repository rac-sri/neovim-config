return {
	"goolord/alpha-nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},

	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.startify")

		dashboard.section.header.val = {
			[[                                                    ]],
			[[  ██████╗ ███████╗███████╗ ██████╗ ██████╗ ██╗██████╗ ]],
			[[ ██╔═══██╗██╔════╝██╔════╝██╔════╝ ██╔══██╗██║██╔══██╗]],
			[[ ██║   ██║█████╗  █████╗  ██║  ███╗██████╔╝██║██║  ██║]],
			[[ ██║   ██║██╔══╝  ██╔══╝  ██║   ██║██╔══██╗██║██║  ██║]],
			[[ ╚██████╔╝██║     ██║     ╚██████╔╝██║  ██║██║██████╔╝]],
			[[  ╚═════╝ ╚═╝     ╚═╝      ╚═════╝ ╚═╝  ╚═╝╚═╝╚═════╝ ]],
			[[                                                    ]],
			[[                     only local state                ]],
		}

		dashboard.section.header.opts.hl = "AlphaHeader"

		vim.api.nvim_set_hl(0, "AlphaHeader", { fg = "#4fd1c5" })

		alpha.setup(dashboard.opts)
	end,
}
