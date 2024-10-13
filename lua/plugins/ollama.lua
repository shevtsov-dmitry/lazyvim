return {
  "nomnivore/ollama.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },

  -- All the user commands added by the plugin
  cmd = { "Ollama", "OllamaModel", "OllamaServe", "OllamaServeStop" },

  keys = {
    -- Sample keybind for prompt menu. Note that the <c-u> is important for selections to work properly.
    {
      "<leader>oo",
      ":<c-u>lua require('ollama').prompt()<cr>",
      desc = "ollama prompt",
      mode = { "n", "v" },
    },

    -- Sample keybind for direct prompting. Note that the <c-u> is important for selections to work properly.
    {
      "<leader>oG",
      ":<c-u>lua require('ollama').prompt('Generate_Code')<cr>",
      desc = "ollama Generate Code",
      mode = { "n", "v" },
    },
  },

  ---@type Ollama.Config
  opts = {
    model = "codellama",
    url = "http://localhost:11434",
    -- serve = {
    --   on_start = false,
    --   command = "ollama",
    --   args = { "serve" },
    --   stop_command = "pkill",
    --   stop_args = { "-SIGTERM", "ollama" },
    -- },
    -- View the actual default prompts in ./lua/ollama/prompts.lua
    prompts = {
      -- example prompt
      -- prompt = 'This is a sample prompt that receives $input and $sel(ection), among others.',
      Explain_English = {
        -- prompt = 'This is a sample prompt that receives $input and $sel(ection), among others.',
        prompt = "You are an english language teacher, I am not native with english language and you need to explain word or sentence to me simply clearly and easy. I ask you about clarifying $input in the context $sel",
        input_label = "> ",
        model = "llama3.1",
        action = "display",
      },

      Translate_to_russian = {
        -- prompt = 'This is a sample prompt that receives $input and $sel(ection), among others.',
        prompt = "You are a talanted and proficient russian translator. You need to translate this: $sel",
        input_label = "> ",
        model = "llama3.1",
        action = "display",
      },
    },
  },
}
