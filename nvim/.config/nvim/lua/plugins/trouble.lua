return {
    "folke/trouble.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        require("trouble").setup({})

        bind("n", "<Leader>xx", "<cmd>TroubleToggle<cr>", "Trouble Toggle")
        bind("n", "<Leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", "Trouble Toggle Workspace Diagnostics")
        bind("n", "<Leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", "Trouble Toggle Document Diagnostics")
        bind("n", "<Leader>xq", "<cmd>TroubleToggle quickfix<cr>", "Trouble Toggle Quickfix")
        bind("n", "<Leader>xl", "<cmd>TroubleToggle loclist<cr>", "Trouble Toggle Location List")
        bind("n", "gR", "<cmd>TroubleToggle lsp_references<cr>", "Trouble Toggle LSP References")
    end,
}
