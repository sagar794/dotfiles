-- Enable LSP servers
vim.lsp.enable({
  "pyright",
  "lua_ls",
  "ts_ls",
  "gopls",
  "marksman",
  "dockerls",
  "bashls",
})

-- Truncate diagnostic messages over 100 characters in virtual text
vim.diagnostic.config({
  signs = false,
  virtual_text = {
    prefix = '',
    format = function(diagnostic)
      local max_width = 100
      local message = diagnostic.message:gsub("\n", " ")
      if #message > max_width then
        return "● " .. string.sub(message, 1, max_width) .. "..."
      end
      return "● " .. message
    end,
  },
  underline = true,
  float = {
    border = "rounded",
    source = true,
    prefix = '',
  },
})

-- Show diagnostic in floating window
vim.keymap.set('n', 'gl', vim.diagnostic.open_float, { desc = "Show diagnostic" })

vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    local diagnostics = vim.diagnostic.get(0, {lnum = vim.api.nvim_win_get_cursor(0)[1] - 1 })
    for _, diagnostic in ipairs(diagnostics) do
      if #diagnostic.message > 100 then
        vim.diagnostic.open_float({ focus = false, prefix = "" })
        return
      end
    end
  end,
})


vim.opt.updatetime = 500
