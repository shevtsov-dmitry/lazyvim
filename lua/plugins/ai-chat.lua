MODEL = "deepseek-r1:8b"

return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-lua/plenary.nvim",
  },
  cmd = {
    "CodeCompanion",
    "CodeCompanionChat",
    "CodeCompanionToggle",
    "CodeCompanionActions",
  },
  keys = {
    {
      "<leader>l",
      mode = { "n", "v" },
      "<cmd>CodeCompanionChat Toggle<cr>",
      desc = "Open AI chat",
    },
    {
      "ga",
      mode = { "v" },
      "<cmd>CodeCompanionChat Add<cr>",
      desc = "Add selection to AI chat",
    },
    {
      "<leader>cl",
      mode = { "n", "v" },
      "<cmd>CodeCompanionActions<cr>",
      desc = "Add selection to AI chat",
    },
  },
  config = function()
    require("codecompanion").setup({
      strategies = {
        chat = {
          adapter = "ollama",
        },
        inline = {
          adapter = "ollama",
        },
      },
      adapters = {
        ollama = function()
          return require("codecompanion.adapters").extend("ollama", {
            schema = { model = { default = MODEL } },
          })
        end,
      },
    })
    -- Command abbreviation for convenience
    vim.cmd([[cab cc CodeCompanion]])
  end,
}
