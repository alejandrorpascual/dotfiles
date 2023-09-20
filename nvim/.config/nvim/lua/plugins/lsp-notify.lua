return {
    "mrded/nvim-lsp-notify",
    dependencies = { "rcarriga/nvim-notify" },
    enabled = false,
    config = function()
        require("lsp-notify").setup({
            notify = require("notify"),
        })
    end,
}
