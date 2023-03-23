return {
    "phaazon/hop.nvim",
    name = "hop",
    keys = {
        { "<leader>w", "<cmd>HopWord<cr>", desc = "Hop Word" },
        { ",f", "<cmd>HopChar1<cr>", desc = "Hop Char" },
    },
    config = function()
        -- you can configure Hop the way you like here; see :h hop-config
        require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
    end,
}
