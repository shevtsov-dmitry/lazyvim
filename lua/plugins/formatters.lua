return {
  "stevearc/conform.nvim",
  dependencies = {
    "google/google-java-format",
  },
  keys = {
    {
      "<A-S-F>",
      function()
        require("conform").format({ async = true, lsp_format = "fallback" })
      end,
      mode = "",
      desc = "[F]ormat buffer",
    },
  },
  opts = {
    notify_on_error = false,
    format_on_save = false,
    formatters = {
      google_java_format = {
        command = "google-java-format",
        args = { "-i", "$FILENAME" }, -- Use file-based formatting . "--aosp" flag for 4 indent instead of default 2.
        stdin = false, -- Must be false, because google-java-format doesn't support stdin
      },
    },
    formatters_by_ft = {
      lua = { "stylua" },
      java = { "google_java_format" },
      -- javascript = { "prettierd", "prettier", stop_after_first = true },
    },
  },
}
