return {
  -- add gruvbox
  { "ellisonleao/gruvbox.nvim" },
  { "Mofiqul/vscode.nvim" },

  -- light
  { "savq/melange-nvim" },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "melange",
      termguicolors = true,
    },
  },
}
