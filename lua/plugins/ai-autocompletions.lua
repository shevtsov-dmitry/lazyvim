-- set the following line in your config/options.lua
vim.g.lazyvim_blink_main = true

return {
  {
    "milanglacier/minuet-ai.nvim",
    config = function()
      require("minuet").setup({
        -- basic tuning
        provider = "openai_fim_compatible",
        n_completions = 1, -- keep small for local speed + resource
        context_window = 1024, -- start small; increase only if your machine handles it
        add_single_line_entry = true, -- avoid multi-line items causing indentation issues
        -- throttle / debounce to prevent excessive requests on typing
        throttle = 1000,
        debounce = 250,

        -- Notifications & debug (set to 'debug' while troubleshooting, revert to 'warn' later)
        notify = "warn",
        -- streaming can help with slow local models; set true to receive tokens as they arrive.
        stream = true,
        -- request timeout in seconds (higher for slow local machines)
        request_timeout = 15,

        -- avoid auto-complete via LSP; we'll use Blink native provider and manual triggering
        lsp = {
          enabled_ft = {},
          enabled_auto_trigger_ft = {},
          warn_on_blink_or_cmp = false,
        },

        -- Do NOT auto-complete for blink/cmp by default; we'll trigger manually
        blink = {
          enable_auto_complete = false,
          trigger = {
            -- number of typed chars before triggering (0 = always)
            completion_trigger_character_count = 0,
          },
        },
        cmp = {
          enable_auto_complete = false,
        },

        -- provider options for openai_fim_compatible -> Ollama
        provider_options = {
          openai_fim_compatible = {
            -- pass a function that returns env var (fast & explicit)
            api_key = function()
              -- Ollama doesn't need a "real" key, but Minuet expects a non-nil value.
              -- Ensure TERM is set in the environment before launching nvim, or change this to another var.
              return vim.env.TERM or "OLLAMA_PLACEHOLDER"
            end,
            name = "Ollama",
            end_point = "http://localhost:11434/v1/completions",
            model = "qwen2.5-coder:1.5b",

            optional = {
              -- adjust token budget as needed
              max_tokens = 128,
              top_p = 0.9,
              temperature = 0.0,
            },
          },
        },
      })
    end,
  },
  {
    "saghen/blink.cmp",
    optional = true,
    opts = {
      keymap = {
        -- ["<A-q>"] = {
        --   function(cmp)
        --     cmp.show({ providers = { "minuet" } })
        --   end,
        -- },
      },
      sources = {
        -- if you want to use auto-complete
        default = { "minuet" },
        providers = {
          minuet = {
            name = "minuet",
            module = "minuet.blink",
            score_offset = 100,
          },
        },
      },
    },
  },
}
