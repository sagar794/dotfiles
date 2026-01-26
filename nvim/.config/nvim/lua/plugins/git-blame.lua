return {
  "f-person/git-blame.nvim",
  event = "VeryLazy",
  opts = {
    enabled = false,
    date_format = "%Y-%m-%d",
  },
  keys = {
    { "<leader>gb", ":GitBlameToggle<cr>", mode = { "n", "v" }, desc = "Toggle inline git blame" },
    { "<leader>gc", ":GitBlameOpenCommitURL<cr>", mode = { "n", "v" }, desc = "Open commit in browser" },
    { "<leader>go", ":GitBlameOpenFileURL<cr>", mode = { "n", "v" }, desc = "Open file in browser" },
    { "<leader>gy", ":GitBlameCopyFileURL<cr>", mode = { "n", "v" }, desc = "Copy GitHub permalink" },
  },
}
