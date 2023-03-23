return {
    "lewis6991/gitsigns.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function()
        require("gitsigns").setup({
            numhl = true, -- Toggle with `:Gitsigns toggle_numhl`
            linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
            word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
        })

        bind("n", "]f", "<cmd>Gitsigns next_hunk<CR>", "Gitsigns next_hunk")
        bind("n", "[f", "<cmd>Gitsigns prev_hunk<CR>", "Gitsigns prev_hunk")
        bind("n", "<Leader>ph", "<cmd>Gitsigns preview_hunk<CR>", "Gitsigns preview_hunk")
        bind("n", "<Leader>gf", "<cmd>Gitsigns diffthis<CR>", "Gitsigns diffthis")
    end,
}
