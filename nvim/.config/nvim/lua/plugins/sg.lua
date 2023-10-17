return {
    "sourcegraph/sg.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        require("sg").setup()

        bind(
            "n",
            "<space>ss",
            "<cmd>lua require('sg.extensions.telescope').fuzzy_search_results()<CR>",
            "Search Sourcegraph"
        )
    end,
}
