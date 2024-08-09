return {
  { "nyoom-engineering/oxocarbon.nvim" }, -- dark, darker, cool, deep, warm, warmer
  -- { "folke/tokyonight.nvim" }, -- night, day, storm, moon
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
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
