local lsp_attach = require("config.lsp.attach")
local lsp_flags = require("config.lsp.flags")

return function(ops)
        return vim.tbl_extend("force", {
            on_attach = function(client, bufnr)
                client.server_capabilities.documentFormattingProvider = false
                vim.keymap.set(
                    "n",
                    "<leader>co",
                    "TypescriptOrganizeImports",
                    { buffer = bufnr, desc = "Organize Imports" }
                )
                vim.keymap.set("n", "<leader>cR", "TypescriptRenameFile", { desc = "Rename File", buffer = bufnr })
            lsp_attach(client, bufnr)
            end,
            flags = lsp_flags,
            settings = {
                typescript = {
                    inlayHints = {
                        includeInlayParameterNameHints = "all",
                        includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                        includeInlayFunctionParameterTypeHints = true,
                        includeInlayVariableTypeHints = true,
                        includeInlayPropertyDeclarationTypeHints = true,
                        includeInlayFunctionLikeReturnTypeHints = true,
                        includeInlayEnumMemberValueHints = true,
                        importModuleSpecifierPreference = "non-relative",
                    },
                },
                javascript = {
                    inlayHints = {
                        includeInlayParameterNameHints = "all",
                        includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                        includeInlayFunctionParameterTypeHints = true,
                        includeInlayVariableTypeHints = true,
                        includeInlayPropertyDeclarationTypeHints = true,
                        includeInlayFunctionLikeReturnTypeHints = true,
                        includeInlayEnumMemberValueHints = true,
                    },
                },
            },
        }, ops)
    end
