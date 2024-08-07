local model = "llama3.1"

return {
    "olimorris/codecompanion.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    opts = {
        strategies = {
            chat = {
                adapter = "ollama",
            },
            inline = {
                adapter = "ollama",
            },
        },
        display = {
            chat = {
                show_settings = true
            }
        },
        adapters = {
            ollama = function()
                return require("codecompanion.adapters").use("ollama", {
                    schema = {
                        model = {
                            default = model,
                        },

                    },
                })
            end,
        },
    },
    config = function(_, opts)
        require("codecompanion").setup(opts)
        -- Expand `cc` into CodeCompanion in the command line
        vim.cmd([[cab cc CodeCompanion]])
    end,
    keys = {
        {
            "<leader>ic",
            "<cmd>CodeCompanionToggle<CR>",
            desc = "A[I] [C]hat",
            mode = { "n", "v" },
        },
        {
            "<leader>ia",
            "<cmd>CodeCompanion<CR>",
            desc = "A[I] [A]sk",
            mode = { "n", "v" },
        },
        {
            "<leader>il",
            "<cmd>CodeCompanionActions<CR>",
            desc = "A[I] [L]ist of actions",
            mode = { "n", "v" },
        },
    },
}
