return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = "VeryLazy",
  config = function()
    require("nvim-treesitter").install({
      "bash",
      "dockerfile",
      "go",
      "lua",
      "markdown",
      "python",
      "typescript",
      "javascript",
      "json",
      "yaml",
      "html",
      "css",
    })
  end,
}
