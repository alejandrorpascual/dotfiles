local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
    return
end

-- local completion = null_ls.builtins.completion
local code_actions = null_ls.builtins.code_actions
-- local h = require("null-ls.helpers")
-- local methods = require("null-ls.methods")

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

require("mason-null-ls").setup({
    automatic_installation = false,
    ensure_installed = {
        -- "prettierd",
        -- "eslint_d",
        -- "stylua",
        -- "black",
        -- "golangci_lint",
        -- "phpstan",
        -- "ruff",
        -- "pint",
        -- "blade-formatter",
        -- "mypy",
    },
})

null_ls.setup({
    sources = {
        null_ls.builtins.completion.spell,
        formatting.gofmt,
        diagnostics.tsc,
        formatting.prettierd,
        diagnostics.eslint_d,
        code_actions.eslint_d,
        code_actions.gitsigns,
        code_actions.refactoring
    },
})
