local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
    return
end

null_ls.setup({
    sources = {
        -- formatting.gofmt,
        -- null_ls.builtins.diagnostics.eslint,
        -- null_ls.builtins.code_actions.eslint,
        null_ls.builtins.completion.spell,
        null_ls.builtins.formatting.gofmt,
        null_ls.builtins.formatting.prettierd,
        -- null_ls.builtins.formatting.prettier,
        null_ls.builtins.formatting.sql_formatter.with({
            extra_filetypes = { "sql", "bigquery" },
            extra_args = { "-l", "bigquery" },
        }),
        null_ls.builtins.formatting.shfmt,
        -- require("none-ls.diagnostics.eslint_d"),
        -- require("none-ls.code_actions.eslint_d"),
        require("none-ls.diagnostics.eslint"),
        require("none-ls.code_actions.eslint"),
        null_ls.builtins.code_actions.gitsigns,
        null_ls.builtins.code_actions.refactoring,
        null_ls.builtins.diagnostics.actionlint
    },
})
