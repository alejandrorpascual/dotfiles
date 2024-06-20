local lspsaga = require("lspsaga")

lspsaga.setup({})

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

bind("n", "[E", function()
    require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
end, "Prev Error")

bind("n", "]E", function()
    require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
end, "Next Error")
