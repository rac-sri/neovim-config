return {
  "petertriho/nvim-scrollbar",
  dependencies = {
    "kevinhwang91/nvim-hlslens", -- optional, but nice
  },
  config = function()
    require("scrollbar").setup({
      show = true,
      show_in_active_only = true,
      set_highlights = true,
      handlers = {
        cursor = true,
        diagnostic = true,
        search = false,
        gitsigns = false,
      },
      marks = {
        DiagnosticError = { text = "▎" },
        DiagnosticWarn  = { text = "▎" },
        DiagnosticInfo  = { text = "▎" },
        DiagnosticHint  = { text = "▎" },
      },
    })
  end,
}

