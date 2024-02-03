-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- This file is automatically loaded by lazyvim.config.init
local Util = require("lazyvim.util")

-- DO NOT USE THIS IN YOU OWN CONFIG!!
-- use `vim.keymap.set` instead
local map = Util.safe_keymap_set
-- map("n", "<F8>", ":!gcc % && ./a.out<CR>", { desc = "Compile and run current file with GCC", noremap = true })
map("n", "<leader>rr", ":!gcc % && ./a.out<CR>", { desc = "Compile and run current file with GCC", noremap = true })
map("n", "<leader>rz", ":!zig run %<CR>", { noremap = true })
