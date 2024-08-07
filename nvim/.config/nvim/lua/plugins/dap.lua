return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "leoluz/nvim-dap-go",
        "Pocco81/DAPInstall.nvim",
        { "rcarriga/nvim-dap-ui", dependencies = { "nvim-neotest/nvim-nio" } },
        "theHamsta/nvim-dap-virtual-text",
        "mxsdev/nvim-dap-vscode-js",
    },
    config = function()
        require("config.dap").setup()
    end,
}
