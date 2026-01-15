return {
	"coder/claudecode.nvim",
	dependencies = { "folke/snacks.nvim" },
	config = true,
	keys = {
		{ "<leader>c", nil, desc = "AI/Claude Code" },
		{ "<leader>cp", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude" },
		{ "<leader>cf", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude" },
		{ "<leader>ca", "<cmd>ClaudeCode --resume<cr>", desc = "Resume Claude" },
		{ "<leader>cc", "<cmd>ClaudeCode --continue<cr>", desc = "Continue Claude" },
		{ "<leader>cb", "<cmd>ClaudeCodeAdd %<cr>", desc = "Add current buffer" },
		{ "<leader>cs", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send to Claude" },
		{
			"<leader>cs",
			"<cmd>ClaudeCodeTreeAdd<cr>",
			desc = "Add file",
			ft = { "NvimTree", "neo-tree", "oil", "minifiles", "netrw" },
		},
		-- Diff management
		{ "<leader>ca", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
		{ "<leader>cd", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Deny diff" },
	},
}
