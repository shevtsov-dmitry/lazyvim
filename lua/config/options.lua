-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.autoformat = true

local opt = vim.opt

-- Check if running inside WSL
if vim.fn.has("wsl") == 1 then
  -- Set clipboard to use clip.exe
  vim.g.clipboard = {
    name = "clip.exe",
    copy = {
      ["+"] = "clip.exe",
      ["*"] = "clip.exe",
    },
    paste = {
      ["+"] = "powershell.exe -noprofile -command [Console]::Out.Write($(Get-Clipboard))",
      ["*"] = "powershell.exe -noprofile -command [Console]::Out.Write($(Get-Clipboard))",
    },
    cache_enabled = 0,
  }
else
  opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus" -- Sync with system clipboard
end

opt.shiftwidth = 4
opt.tabstop = 4
opt.wrap = false
opt.confirm = true -- Confirm to save changes before exiting modified buffer
opt.ignorecase = true -- Ignore case
