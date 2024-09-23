return {
    "nvimtools/none-ls.nvim",
    opts = function(_, opts)
        if not opts.sources then opts.sources = {} end
        local go_nls = require("go.null_ls")
        opts.sources = vim.list_extend(opts.sources, {
            go_nls.gotest(),
            go_nls.gotest_action(),
        })
        return opts
    end,
    dependencies = {
        "jayp0521/mason-null-ls.nvim",
        "nvimtools/none-ls-extras.nvim"
    },
    config = function()
        require("config.null-ls")
    end
}
