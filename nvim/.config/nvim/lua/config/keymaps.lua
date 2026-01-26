-- Leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Clear search highlight
vim.keymap.set("n", "<leader>h", ":nohlsearch<cr>", { desc = "Clear search highlight" })
