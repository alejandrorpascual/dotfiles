return {
    "dnlhc/glance.nvim",
    keys = {
        { "<leader>D", "<cmd>Glance definitions<cr>", desc = "Glance definitions" },
        { "<leader>R", "<cmd>Glance references<cr>", desc = "Glance references" },
        { "<leader>Y", "<cmd>Glance type_definitions<cr>", desc = "Glance type definitions" },
        { "<leader>M", "<cmd>Glance implementations<cr>", desc = "Glance implementations" },
    },
    config = function()
        require("glance").setup({})
    end,
}
