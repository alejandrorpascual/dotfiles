return {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {
        on_attach = function(client)
            client.server_capabilities.documentFormattingProvider = false
            client.server_capabilities.documentRangeFormattingProvider = false
        end
    },
    config = function(_, opts)
        require("typescript-tools").setup(opts)

        local wk = require("which-key")
        local api = require("typescript-tools.api")
        local execute = function(fn)
            if vim.bo.filetype == "typescript" or vim.bo.filetype == "typescriptreact" then
                fn()
            end
        end

        wk.add({
            { "<leader>oa", function() execute(api.add_missing_imports) end, desc = "TS Tools Oraganize Imports" },
            { "<leader>oi", function() execute(api.organize_imports) end,    desc = "TS Tools Organize Imports" },
        })
    end
}
