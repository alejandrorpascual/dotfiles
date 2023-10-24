return {
    "dpayne/CodeGPT.nvim",
    enabled = false,
    dependencies = {
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
    },
    config = function()
        require("codegpt.config")
    end,
}
