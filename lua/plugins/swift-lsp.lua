if true then return {} end
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        sourcekit = {
          {
            cmd = "sourcekit-lsp",
          },
        },
      },
    },
  },
}
