return {
    "sidebar-nvim/sidebar.nvim",
    config = function()
        local sidebar = require("sidebar-nvim")
        sidebar.setup({
            side = "right",
            sections = { "diagnostics", "symbols", "files", "git", "buffers" },
            bindings = {
                ["q"] = function()
                    sidebar.close()
                end,
            },
        })
        bind("n", "<space>so", function()
            sidebar.open()
            sidebar.focus()
        end, "Open Sidebar")
    end,
}
