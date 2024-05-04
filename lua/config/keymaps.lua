-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- This file is automatically loaded by lazyvim.config.init
local Util = require("lazyvim.util")

-- use `vim.keymap.set` instead
local map = Util.safe_keymap_set

map("n", "<leader>rc", ":!gcc % -g && ./a.out<CR>", { desc = "[r]un [c] with GCC", noremap = true })
map("n", "<leader>rz", ":!zig run %<CR>", { desc = "[r]un [z]ig", noremap = true })
map("n", "<leader>rg", ":!go build -o main '%' && ./main<CR>", { desc = "[r]un [g]o project", noremap = true })

-- java
map("n", "<leader>rj", ":!java %<CR>", { desc = "[r]un [j]ava", noremap = true })
map(
    "n",
    "<leader>raj",
    ":!java -ea %<CR>",
    { desc = "[r]un with [a]ssertions [j]ava file", noremap = true }
)
-- maven
-- map("n", "<leader>mc", ":!mvn compile<CR>", { desc = "[m]vn [c]ompile", noremap = true })
-- prettier
map("n", "<leader>fm", ":!npx prettier . --write<CR>", { desc = "[f]or[m]at with prettier", noremap = true })

local luasnip = require('luasnip')

local unlinkgrp = vim.api.nvim_create_augroup(
    'UnlinkSnippetOnModeChange',
    { clear = true }
)

-- Make custom Tab key logic
vim.api.nvim_create_autocmd('ModeChanged', {
    group = unlinkgrp,
    pattern = { 's:n', 'i:*' },
    desc = 'Forget the current snippet when leaving the insert mode',
    callback = function(evt)
        if
            luasnip.session
            and luasnip.session.current_nodes[evt.buf]
            and not luasnip.session.jump_active
        then
            luasnip.unlink_current()
        end
    end,
})

vim.keymap.set('i', '<Tab>', function()
    local col = vim.fn.col '.'                   -- Get the current cursor column
    local line = vim.fn.getline '.'              -- Get the current line
    local next_char = string.sub(line, col, col) -- Get the character after the cursor

    if next_char == ']' or next_char == ')' or next_char == '}' or next_char == '>' or next_char == '"' or next_char == "'" then
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Right>', true, false, true), 'n', false)
    elseif luasnip.expand_or_locally_jumpable() then
        luasnip.expand_or_jump()
    else
        vim.api.nvim_put({ '\t' }, '', false, true)
    end
end, {})
