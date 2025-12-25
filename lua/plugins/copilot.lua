return {
	"github/copilot.vim",
	lazy = false, -- load immediately
	event = "InsertEnter", -- optional lazy trigger
	config = function()
		-- No setup function needed for copilot.vim itself
		-- After installation, run :Copilot setup manually once
	end,
}
