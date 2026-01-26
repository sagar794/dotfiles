require("config.keymaps")
require("config.options")
require("config.lazy")

vim.lsp.enable({
  "pyright",
  "lua_ls",
  "ts_ls",
  "gopls",
  "marksman",
  "dockerls",
  "bashls",
})
