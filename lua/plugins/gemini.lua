 return {
 	"jonroosevelt/gemini-cli.nvim",
 	config = function()
 		require("gemini").setup({})
 		vim.api.nvim_set_keymap('n', 'gp', '<cmd>lua require("gemini").toggle_gemini_cli()<CR>', { noremap = true, silent = true })
 		vim.api.nvim_set_keymap('n', 'ga', '<cmd>lua require("gemini").toggle_gemini_cli()<CR>', { noremap = true, silent = true })
 		vim.api.nvim_set_keymap('v', 'gs', '<cmd>lua require("gemini").send_to_gemini()<CR>', { noremap = true, silent = true })
 	end,
 }
