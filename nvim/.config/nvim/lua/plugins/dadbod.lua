return {
    "tpope/vim-dadbod",
    cmd = { "DB", "DBUI" },
    dependencies = {
        {
            "kristijanhusak/vim-dadbod-ui",
            config = function()
                vim.g.db_ui_use_nerd_fonts = 1
            end,
        },
        "kristijanhusak/vim-dadbod-completion",
    },
}
