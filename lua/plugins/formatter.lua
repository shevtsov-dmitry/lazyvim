return {
    {
        "stevearc/conform.nvim",
        event = { "BufWritePre" },
        cmd = { "ConformInfo" },
        keys = {
            {
                -- Customize or remove this keymap to your liking
                "<leader>cfm",
                function()
                    require("conform").format({ async = true, lsp_fallback = true })
                end,
                mode = "",
                desc = "Format buffer",
            },
        },
        -- Everything in opts will be passed to setup()
        opts = {

            {
                relativenumber = true, -- sets vim.opt.relativenumber
                number = true,         -- sets vim.opt.number
                spell = false,         -- sets vim.opt.spell
                signcolumn = "auto",   -- sets vim.opt.signcolumn to auto
                wrap = false,          -- sets vim.opt.wrap
                shiftwidth = 4,
                tabstop = 4,
            },
            -- Define your formatters
            formatters_by_ft = {
                lua = { "stylua" },
                python = { "isort", "black" },
                javascript = { { "prettierd", "prettier" } },
            },
            -- Customize formatters
            formatters = {
                shfmt = {
                    prepend_args = { "-i", "2" },
                },
            },
        },
        init = function()
            -- If you want the formatexpr, here is the place to set it
            vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
        end,
    } }
