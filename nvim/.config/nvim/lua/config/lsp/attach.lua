return function(client, bufnr)
    -- local ops = { buffer = bufnr, remap = false }


    --   if client.server_capabilities.inlayHintProvider then
    --     vim.lsp.inlay_hint(bufnr, true)
    -- end

    if client.name == "tsserver" then
        require("twoslash-queries").attach(client, bufnr)
        bind("n", "<Leader><Leader>k", "<cmd>InspectTwoslashQueries<CR>", "Inspect Twoslash Queries")
    end

    bind("n", "<space>wl", function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders))
    end, "LSP list workspace folders")

    -- nnoremap("gD", vim.lsp.buf.declaration)
    -- nnoremap("gd", vim.lsp.buf.definition)
    --
    -- nnoremap("gy", vim.lsp.buf.implementation)
    -- nnoremap("<Leader>K", vim.lsp.buf.signature_help) -- builtin lsp
    -- nnoremap("<space>wa", vim.lsp.buf.add_workspace_folder)
    -- nnoremap("<space>wk", vim.lsp.buf.remove_workspace_folder)
    -- nnoremap("<space>D", vim.lsp.buf.type_definition)
    -- bind("n", "<space>rn", vim.lsp.buf.rename, { buffer = bufnr, desc = "LSP Rename" })
    -- nnoremap("<leader>sg", vim.lsp.buf.signature_help)
    -- nnoremap("gr", vim.lsp.buf.references)
    -- nnoremap("[d", vim.diagnostic.goto_prev)
    -- nnoremap("]d", vim.diagnostic.goto_next)
    bind("n", "<space>lc", vim.diagnostic.setloclist, "LSP setloclist")
    bind("n", "<space>q", vim.diagnostic.setqflist, "LSP setqflist")

    vim.keymap.set("n", "<leader><leader>f", function()
        return vim.lsp.buf.format({
            async = true,
        })
    end, { buffer = 0, desc = "LSP format file" })
end
