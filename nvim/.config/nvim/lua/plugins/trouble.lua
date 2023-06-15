return {
    "folke/trouble.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        require("trouble").setup({})

        bind("n", "<Leader>xx", "<cmd>TroubleToggle<cr>", { desc = "Trouble Toggle" })
        bind(
            "n",
            "<Leader>xw",
            "<cmd>TroubleToggle workspace_diagnostics<cr>",
            { desc = "Trouble Toggle Workspace Diagnostics" }
        )
        bind(
            "n",
            "<Leader>xd",
            "<cmd>TroubleToggle document_diagnostics<cr>",
            { desc = "Trouble Toggle Document Diagnostics" }
        )
        bind("n", "<Leader>xq", "<cmd>TroubleToggle quickfix<cr>", { desc = "Trouble Toggle Quickfix" })
        bind("n", "<Leader>xl", "<cmd>TroubleToggle loclist<cr>", { desc = "Trouble Toggle Location List" })
        bind("n", "gR", "<cmd>TroubleToggle lsp_references<cr>", { desc = "Trouble Toggle LSP References" })
    end,
}
