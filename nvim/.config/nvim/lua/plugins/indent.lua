-- Add indentation guides even on blank lines
return {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
        require("ibl").setup({
            indent = {
                char = "┊",
            },
            exclude = {
                filetypes = {
                    "help",
                    "terminal",
                    "packer",
                    "lspinfo",
                    "TelescopePrompt",
                    "TelescopeResults",
                },
                buftypes = {
                    "terminal",
                    "NvimTree",
                },
            },
        })
    end,
}
