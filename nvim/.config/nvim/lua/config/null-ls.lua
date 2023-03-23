local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
    return
end

-- null_ls.register(null_ls.builtins.diagnostics.phpcs.with({
--   command = "phpcs",
-- }))
--
-- null_ls.register(null_ls.builtins.formatting.phpcbf.with({
--   command = "phpcbf",
-- }))

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
-- local completion = null_ls.builtins.completion
local code_actions = null_ls.builtins.code_actions
local h = require("null-ls.helpers")
local methods = require("null-ls.methods")

null_ls.setup({
    sources = {
        formatting.stylua,
        formatting.prettierd,
        formatting.autopep8,
        -- formatting.sql_formatter,
        -- formatting.prismaFmt,
        -- formatting.gofmt,
        diagnostics.golangci_lint,
        formatting.gofmt,
        diagnostics.eslint_d,
        diagnostics.phpstan,
        code_actions.refactoring,
        code_actions.eslint_d,
        formatting.prettier.with({
            filetypes = { "liquid" },
        }),
        formatting.pint,
        h.make_builtin({
            name = "blade_formatter",
            factory = h.formatter_factory,
            method = { methods.internal.FORMATTING },
            filetypes = { "blade" },
            generator_opts = {
                command = "blade-formatter",
                args = { "--stdin" },
                to_stdin = true,
            },
            meta = {
                url = "https://github.com/shufo/blade-formatter",
                description = "An opinionated blade template formatter for Laravel that respects readability",
            },
        }),
        -- diagnostics.phpstan,
        -- diagnostics.eslint,
        -- code_actions.eslint,
    },
})

require("mason-null-ls").setup({ automatic_installation = true })
