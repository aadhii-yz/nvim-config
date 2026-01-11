-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- # NOTES :
-- Delete an existing keymap with `vim.keymap.del`
-- Add a keymap with `vim.keymap.set`

-- vim.keymap.set("i", "jj", "<ESC>")
-- vim.keymap.set("v", "<leader>y", '"+y', opts)

vim.keymap.set("n", "ge", "G")
vim.keymap.set("n", "gl", "$")
vim.keymap.set("n", "gh", "0")
-- vim.keymap.set("n", "<leader>k", "K")
-- vim.keymap.set("n", "U", "<CTRL>r")
