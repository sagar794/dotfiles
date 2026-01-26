return {
  "folke/twilight.nvim",
  event = "VeryLazy",
  opts = {
    dimming = {
      alpha = 0.25,
      inactive = true,
    },
    context = 0,
    treesitter = true,
    expand = {
      "function",
      "method",
      "table",
      "if_statement",
    },
  },
  keys = {
    { "<leader>tw", ":Twilight<cr>", desc = "Toggle Twilight" },
  },
}
