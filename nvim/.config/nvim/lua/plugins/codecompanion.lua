local model = "llama3.1"

return {
    "olimorris/codecompanion.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },

    config = function()
        require("codecompanion").setup()
        -- Expand `cc` into CodeCompanion in the command line
        vim.cmd([[cab cc CodeCompanion]])

        local wk = require("which-key")
        wk.add({
            { "<leader>i",  group = "CodeCompanion" },
            { "<leader>ic", "<cmd>CodeCompanionToggle<CR>",  desc = "A[I] [C]hat" },
            { "<leader>ia", "<cmd>CodeCompanion<CR>",        desc = "A[I] [A]sk" },
            { "<leader>il", "<cmd>CodeCompanionActions<CR>", desc = "A[I] [L]ist of actions" },
        })
    end,
}
