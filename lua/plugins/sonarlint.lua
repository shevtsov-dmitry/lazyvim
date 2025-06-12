if true then
	return {}
end
return {
  "sonarlint.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim", -- Required dependency
    "nvim-treesitter/nvim-treesitter", -- Required for parsing and highlighting
    "lewis6991/gitsigns.nvim", -- Optional, but recommended for SCM support
  },
  config = function()
    local lspconfig = require("lspconfig")

    -- SonarLint setup
    require("sonarlint").setup({
      server = {
        cmd = {
          "sonarlint-language-server",
          "-stdio",
          "-analyzers",
          vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarpython.jar"),
          vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarcfamily.jar"),
          vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarjava.jar"),
        },
      },
      filetypes = {
        "python",
        "cpp",
        "java",
      },
    })
  end,
}
