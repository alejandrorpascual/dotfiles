return {
    "j-hui/fidget.nvim",
    -- turn off momentarily
    enabled = false,
    tag = "legacy",
    event = "LspAttach",
    config = function()
        require("fidget").setup({
            sources = {
                ["null-ls"] = {
                    ignore = true,
                },
            },
        })
    end,
}
