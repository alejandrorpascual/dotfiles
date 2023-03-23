require("trouble").setup({
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
})

bind("n", "<Leader>xx", "<cmd>TroubleToggle<cr>")
bind("n", "<Leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>")
bind("n", "<Leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>")
bind("n", "<Leader>xq", "<cmd>TroubleToggle quickfix<cr>")
bind("n", "<Leader>xl", "<cmd>TroubleToggle loclist<cr>")
bind("n", "gR", "<cmd>TroubleToggle lsp_references<cr>")
