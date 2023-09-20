return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
        {
            "s1n7ax/nvim-window-picker",
            name = "window-picker",
            event = "VeryLazy",
            version = "2.*",
            config = function()
                require("window-picker").setup({
                    autoselect_one = true,
                    include_current = false,
                    filter_rules = {
                        -- filter using buffer options
                        bo = {
                            -- if the file type is one of following, the window will be ignored
                            filetype = { "neo-tree", "neo-tree-popup", "notify" },

                            -- if the buffer type is one of following, the window will be ignored
                            buftype = { "terminal", "quickfix" },
                        },
                    },
                    other_win_hl_color = "#e35e4f",
                })
            end,
        },
    },
    config = function()
        require("neo-tree").setup({
            filesystem = {
                follow_current_file = {
                    enabled = true,
                },
            },
            buffers = {
                follow_current_file = {
                    enabled = true,
                },
            },
        })

        bind("n", "<C-n>", ":Neotree toggle float<CR>")
        bind("n", "<Leader>nf", ":Neotree toggle float reveal reveal_force_cwd<cr>")
    end,
}
