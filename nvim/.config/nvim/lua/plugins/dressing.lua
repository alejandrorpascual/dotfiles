return {
    "stevearc/dressing.nvim",
    lazy = true,
    enabled = false,
    init = function()
        vim.ui.select = function(...)
            require("lazy").load({ plugins = { "dressing.nvim" } })
            return vim.ui.select(...)
        end
        vim.ui.input = function(...)
            require("lazy").load({ plugins = { "dressing.nvim" } })
            return vim.ui.input(...)
        end
    end,
    config = function()
        require("dressing").setup({
            input = {
                insert_only = false,
                prompt_align = "left",
                relative = "editor",
            },
        })
    end,
}
