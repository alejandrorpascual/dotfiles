return {
    "rcarriga/nvim-notify",
    opts = {
        stages = "static",
        timeout = 2000,
        fps = 75,
        max_height = function()
            return math.floor(vim.o.lines * 0.75)
        end,
        max_width = function()
            return math.floor(vim.o.columns * 0.75)
        end,
        on_open = function(win)
            vim.api.nvim_win_set_config(win, { zindex = 100 })
        end,

    },
    config = function(_, opts)
        local notify = require("notify")
        -- this for transparency
        notify.setup(opts)
        -- this overwrites the vim notify function
        -- band null ls code_action complete message
        -- local banned_messages = { "Complete" }
        vim.notify = notify

        local wk = require("which-key")
        wk.add({
            { "<leader>x", group = "Notify" },
            {
                "<leader>xd",
                function()
                    require('notify').dismiss({
                        silent = true,
                        pending = true,
                    })
                end,
                desc = "Dismiss"
            },
        })
    end,
}
