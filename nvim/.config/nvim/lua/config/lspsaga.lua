local lspsaga = require("lspsaga")

lspsaga.setup({
    -- diagnostic_message_format = "[%s] - %m %c",
    event = "LspAttach",
    diagnostic = {
        show_source = true,
    },
    -- symbol_in_winbar = {
    --     enable = false,
    -- },
})

bind("n", "<Leader>e", "<cmd>Lspsaga show_line_diagnostics<CR>")

-- lsp provider to find the cursor word definition and reference
bind("n", "gh", "<cmd>Lspsaga lsp_finder<CR>")
-- asdasdasda

-- code action
bind("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>")
bind("v", "<leader>ca ", ":<C-U>lua require('lspsaga.codeaction').range_code_action()<CR>")

-- show hover doc
bind("n", "K", "<cmd>Lspsaga hover_doc<CR>")

-- scroll down hover doc or scroll in definition preview
bind("n", "<C-f>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>")

bind("n", "<C-b>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>")

-- preview definition
bind("n", "<Leader>cpd", "<cmd>Lspsaga preview_definition<CR>")
-- line diagnostics
bind("n", "<Leader>cld", "<cmd>Lspsaga show_line_diagnostics<CR>")
