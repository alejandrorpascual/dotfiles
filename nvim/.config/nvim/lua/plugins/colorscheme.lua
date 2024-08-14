return {
    {
        "folke/tokyonight.nvim",
        dependencies = {
            "hoob3rt/lualine.nvim",
        },
        -- dependencies = { "f-person/auto-dark-mode.nvim", "hoob3rt/lualine.nvim" },
        lazy = false,
        config = function()
            -- require("config.nightfox")

            -- customize()
            vim.cmd("colorscheme tokyonight-storm")
            bind("n", "<leader>cc", toggle_colorscheme, "Toggle colorscheme")
        end,
    },
    {
        "catppuccin/nvim",
        -- dependencies = { "f-person/auto-dark-mode.nvim" },
        name = "catppuccin",
        config = function()
            bind("n", "<leader>cc", toggle_colorscheme, "Toggle colorscheme")
        end,
    },
    {
        "EdenEast/nightfox.nvim",
        lazy = false,
        -- priority = 1000,
        dependencies = { "hoob3rt/lualine.nvim" },
        -- config = function()
        --     require("config.nightfox")
        --
        --     -- customize()
        --     vim.cmd("colorscheme nightfox")
        --     bind("n", "<leader>cc", ":lua toggle_colorscheme()<CR>", "Toggle colorscheme")
        -- end,
    },
}
