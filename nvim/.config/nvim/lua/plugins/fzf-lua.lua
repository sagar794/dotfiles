return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = "VeryLazy",
  opts = {
    keymap = {
      builtin = {
        ["<C-d>"] = "preview-page-down",
        ["<C-u>"] = "preview-page-up",
      },
    },
  },
  keys = {
    { "<leader>ff", function() require("fzf-lua").files() end, desc = "Find files" },
    { "<leader>fg", function() require("fzf-lua").live_grep() end, desc = "Live grep" },
    { "<leader>fr", function() require("fzf-lua").resume() end, desc = "Resume last search" },
    { "<leader>fb", function() require("fzf-lua").git_branches() end, desc = "Git branches" },
    { "<leader>fc", function() require("fzf-lua").git_commits() end, desc = "Git commits" },
  },
}
