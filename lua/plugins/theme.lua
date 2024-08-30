vim.opt.termguicolors = true

return {
  { "nyoom-engineering/oxocarbon.nvim" },
  { "folke/tokyonight.nvim" }, -- night, day, storm, moon
  {
    "rose-pine/neovim",
    name = "rose-pine",
    opts = {
      variant = "moon", -- auto, main, moon, or dawn
    },
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      flavour = "macchiato", -- latte, frappe, macchiato, mocha
    },
  },
  {
    "navarasu/onedark.nvim",
    opts = {
      -- transparent = true,
      term_colors = true,
      style = "warmer", -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
    },
  },
  {
    "Mofiqul/vscode.nvim",
    opts = {
      -- transparent = true,
      italic_comments = true,
      -- disable_nvimtree_bg = true,
      -- style = "light",
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "rose-pine",
    },
  },
}
