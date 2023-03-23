-- Add indentation guides even on blank lines
return {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
        require("indent_blankline").setup({
            char = "┊",
            show_trailing_blankline_indent = false,
            space_char_blankline = " ",
            filetype_exclude = {
                "help",
                "terminal",
                "packer",
                "lspinfo",
                "TelescopePrompt",
                "TelescopeResults",
            },
            buftype_exclude = {
                "terminal",
                "NvimTree",
            },
        })
    end,
}
