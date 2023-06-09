return function(client, bufnr)
    -- print("Attaching to " .. client.name)

    local ops = { buffer = bufnr, remap = false }
    local nnoremap = function(lhs, rhs)
        vim.keymap.set("n", lhs, rhs, ops)
    end

    if client.name == "tsserver" then
        require("twoslash-queries").attach(client, bufnr)
        nnoremap("<Leader><Leader>k", "<cmd>InspectTwoslashQueries<CR>")
    end

    nnoremap("<space>wl", function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders))
    end)
    nnoremap("gD", vim.lsp.buf.declaration)
    nnoremap("gd", vim.lsp.buf.definition)

    nnoremap("gy", vim.lsp.buf.implementation)
    nnoremap("<Leader>K", vim.lsp.buf.signature_help) -- builtin lsp
    nnoremap("<space>wa", vim.lsp.buf.add_workspace_folder)
    nnoremap("<space>wr", vim.lsp.buf.remove_workspace_folder)
    -- nnoremap("<space>D", vim.lsp.buf.type_definition)
    nnoremap("<space>rn", vim.lsp.buf.rename)
    nnoremap("<leader>sg", vim.lsp.buf.signature_help)
    nnoremap("gr", vim.lsp.buf.references)
    nnoremap("[d", vim.diagnostic.goto_prev)
    nnoremap("]d", vim.diagnostic.goto_next)
    nnoremap("<space>lc", vim.diagnostic.setloclist)
    nnoremap("<space>q", vim.diagnostic.setqflist)
    nnoremap("<space>f", function()
        vim.lsp.buf.format({ async = true })
    end)
end
