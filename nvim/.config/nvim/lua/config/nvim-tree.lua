require("nvim-tree").setup({
    update_cwd = true,
    view = {
        width = 55,
        side = "right",
    },
    renderer = {
        group_empty = true,
        icons = {
            show = {
                folder_arrow = false,
            },
        },
        indent_markers = {
            enable = true,
        },
    },
})
