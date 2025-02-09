if true then
  return {}
end
return {
  "christoomey/vim-tmux-navigator",
  lazy = false,
  keys = {
    { "<C-l>", "<cmd> TmuxNavigateLeft<CR>", desc = "window left" },
    { "<C-h>", "<cmd> TmuxNavigateRight<CR>", desc = "window right" },
    { "<C-k>", "<cmd> TmuxNavigateUp<CR>", desc = "window up" },
    { "<C-j>", "<cmd> TmuxNavigateDown<CR>", desc = "window down" },
  },
}
