-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Map Ctrl + Backspace to delete the previous word
vim.api.nvim_set_keymap("n", "<C-H>", "bdw", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<C-H>", "<Esc>bdwi", { noremap = true, silent = true })

-- Map Alt + Backspace to delete the previous word
vim.api.nvim_set_keymap("n", "<A-BS>", "bdw", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<A-BS>", "<Esc>bdwi", { noremap = true, silent = true })
