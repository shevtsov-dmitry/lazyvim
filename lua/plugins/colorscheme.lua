return {
    -- add gruvbox
    -- { "ellisonleao/gruvbox.nvim" },
    -- { "Mofiqul/vscode.nvim" },
    {
        "navarasu/onedark.nvim",
        opts = {
            -- transparent = true,
        },
    },
    -- { "catppuccin/nvim", name = "catppuccin", priority = 1000 }
    { "savq/melange-nvim" },
    -- Configure LazyVim to load gruvbox
    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "onedark",
            termguicolors = true,
        },
    },
}
