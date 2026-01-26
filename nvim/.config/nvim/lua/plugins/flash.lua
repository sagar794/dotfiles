return {
  "folke/flash.nvim",
  event = "VeryLazy",
  opts = {
    labels = "asdfghjklqwertyuiopzxcvbnm",
    search = {
      multi_window = true,
      forward = true,
      wrap = true,
      mode = "exact",
      incremental = false,
    },

    jump = {
      jumplist = true,
      pos = "start",
      autojump = false,
    },

    label = {
      uppercase = false,
      after = true,
      before = false,
      style = "overlay",
      reuse = "lowercase",
    },

    highlight = {
      backdrop = true,
      matches = true,
    },

    modes = {
      search = {
        enabled = false,
      },
      char = {
        enabled = true,
        jump_labels = true,
        multi_line = false,
        highlight = { backdrop = false },
      },
      treesitter = {
        labels = "asdfghjklqwertyuiopzxcvbnm",
	jump = { pos = "range" },
	highlight = {
	  backdrop = true,
	  matches = false,
        },
      }
    },
  },
  keys = {
    { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
  },
}
