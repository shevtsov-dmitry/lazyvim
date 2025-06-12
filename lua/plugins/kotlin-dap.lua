if true then return {} end
return {
  "mfussenegger/nvim-dap",
  optional = true,
  dependencies = "williamboman/mason.nvim",
  opts = function()
    local dap = require("dap")
    if not dap.adapters.kotlin then
      dap.adapters.kotlin = {
        type = "executable",
        command = "kotlin-debug-adapter",
        options = { auto_continue_if_many_stopped = false },
      }
    end

    dap.configurations.kotlin = {
      {
        type = "kotlin",
        request = "launch",
        name = "This file",
        -- may differ, when in doubt, whatever your project structure may be,
        -- it has to correspond to the class file located at `build/classes/`
        -- and of course you have to build before you debug
        mainClass = function()
          local file = vim.fn.expand("%:p")
          local lines = vim.fn.readfile(file)
          local pkg = ""

          for _, line in ipairs(lines) do
            local match = line:match("^%s*package%s+([%w%.]+)")
            if match then
              pkg = match
              break
            end
          end

          local fileName = vim.fn.expand("%:t:r") .. "Kt"
          local fullClass = pkg ~= "" and (pkg .. "." .. fileName) or fileName
          print("Using mainClass: " .. fullClass)
          return fullClass
        end,

        beforeLaunch = function()
          -- Run Gradle build before launching debugger
          vim.fn.jobstart({ "./gradlew", ":app:build", "--no-configuration-cache" }, {
            stdout_buffered = true,
            on_exit = function(_, code)
              if code == 0 then
                vim.notify("Gradle build succeeded", vim.log.levels.INFO)
              else
                vim.notify("Gradle build failed!", vim.log.levels.ERROR)
              end
            end,
          })
        end,
        projectRoot = "${workspaceFolder}",
        jsonLogFile = "",
        enableJsonLogging = false,
      },
      {
        -- Use this for unit tests
        -- First, run
        -- ./gradlew --info cleanTest test --debug-jvm
        -- then attach the debugger to it
        type = "kotlin",
        request = "attach",
        name = "Attach to debugging session",
        port = 5005,
        args = {},
        projectRoot = vim.fn.getcwd,
        hostName = "localhost",
        timeout = 2000,
      },
    }
  end,
}
