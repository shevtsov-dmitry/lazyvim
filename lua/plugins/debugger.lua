return {
    {
        "jay-babu/mason-nvim-dap.nvim",
        event = "VeryLazy",
        dependencies = {
            "mfussenegger/nvim-dap",
            "williamboman/mason.nvim",
        },
        opts = {
            handlers = {},
        },
    },
    {
        "mfussenegger/nvim-dap",
        config = function(_, _)
            require("jdtls.dap").setup_dap_main_class_configs() -- discover main class
            -- require("jdtls.setup").add_commands()   -- not related to debugging but you probably want this
        end
    },

}
