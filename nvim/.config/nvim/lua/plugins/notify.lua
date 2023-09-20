return {
    "rcarriga/nvim-notify",
    config = function()
        local notify = require("notify")
        -- this for transparency
        notify.setup({ background_colour = "#000000" })
        -- this overwrites the vim notify function
        -- band null ls code_action complete message
        -- local banned_messages = { "Complete" }

        vim.notify = notify
    end,
}
