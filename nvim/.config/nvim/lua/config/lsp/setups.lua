local on_attach = require("config.lsp.attach")

local lsp_flags = {
    debounce_text_changes = 150,
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

local rt = require("rust-tools")

rt.setup({
    server = {
        on_attach = function(client, bufnr)
            -- Hover actions
            vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
            -- Code action groups
            vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
            on_attach(client, bufnr)
        end,
        settings = {
            ["rust-analyzer"] = {
                checkOnSave = {
                    enable = true,
                    command = "clippy",
                    extraArgs = { "--", "-W", "clippy::pedantic" },
                },
            },
        },
    },
})

return setmetatable({
    -- rust_analyzer = function()
    --     return {
    --         on_attach = on_attach,
    --         capabilities = capabilities,
    --         flags = lsp_flags,
    --         settings = {
    --             ["rust_analyzer"] = {
    --                 cargo = { allFeatures = true },
    --                 checkOnSave = {
    --                     enabled = true,
    --                     command = "clippy",
    --                     extraArgs = { "--no-deps" },
    --                 },
    --             },
    --         },
    --     }
    -- end,
    jsonls = function()
        return {
            capabilities = capabilities,
            on_attach = function(client, bufnr)
                client.server_capabilities.documentFormattingProvider = false
                on_attach(client, bufnr)
            end,
            settings = {
                json = {
                    schemas = require("schemastore").json.schemas(),
                    validate = { enable = true },
                },
            },
        }
    end,
    tsserver = function()
        require("typescript").setup({ server = { capabilities = capabilities, flags = lsp_flags } })
        return {
            on_attach = function(client, bufnr)
                client.server_capabilities.documentFormattingProvider = false
                on_attach(client, bufnr)
                vim.keymap.set(
                    "n",
                    "<leader>co",
                    "TypescriptOrganizeImports",
                    { buffer = bufnr, desc = "Organize Imports" }
                )
                vim.keymap.set("n", "<leader>cR", "TypescriptRenameFile", { desc = "Rename File", buffer = bufnr })
            end,
            capabilities = capabilities,
            flags = lsp_flags,
        }
    end,
    gopls = function()
        -- dump("gopls ?")
        require("lspconfig").gopls.setup({ server = { capabilities = capabilities, flags = lsp_flags } })
        return {
            on_attach = function(client, bufnr)
                client.server_capabilities.documentFormattingProvider = false
                client.server_capabilities.documentRangeFormattingProvider = false
                on_attach(client, bufnr)
            end,
            capabilities = capabilities,
            flags = lsp_flags,
        }
    end,
    lua_ls = function()
        require("neodev").setup({})

        return {
            on_attach = function(client, bufnr)
                client.server_capabilities.documentFormattingProvider = false
                on_attach(client, bufnr)
            end,
            -- -- capabilities = capabilities,
            -- flags = lsp_flags,
            -- settings = {
            --     Lua = {
            --         runtime = {
            --             version = "LuaJIT",
            --             -- path = runtime_path,
            --         },
            --         diagnostics = {
            --             globals = { "vim" },
            --         },
            --         workspace = {
            --             library = vim.api.nvim_get_runtime_file("", true),
            --             checkThirdParty = false,
            --             maxPreload = 2000,
            --             preloadFileSize = 1000,
            --         },
            --         telemetry = {
            --             enable = false,
            --         },
            --     },
            -- },
        }
    end,
}, {
    __index = function()
        return function()
            return {
                on_attach = on_attach,
                flags = lsp_flags,
            }
        end
    end,
})
