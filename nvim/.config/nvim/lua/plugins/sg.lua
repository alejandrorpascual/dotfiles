return {
    "sourcegraph/sg.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    build = "nvim -l build/init.lua",
    config = function()
        require('sg').setup({})
        bind("n", "<space>ss", "<cmd>lua require('sg.extensions.telescope').fuzzy_search_results()<CR>",
            "Search Sourcegraph")
        bind("n", "<space>ct", "<cmd>CodyToggle<CR>", "Toggle Cody")
        bind("n", "<space>ch", "<cmd>CodyChat<CR>", "Cody Chat")
    end,

}
