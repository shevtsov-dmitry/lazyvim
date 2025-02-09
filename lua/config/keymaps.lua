-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Map Alt + Backspace and Ctrl + Backspace to delete the previous word
vim.api.nvim_set_keymap("i", "<C-BS>", "<C-W>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<A-BS>", "<C-W>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-.>", "<cmd>lua vim.lsp.buf.code_action()<CR>", { noremap = true, silent = true })
