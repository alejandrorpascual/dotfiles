return {
    "sourcegraph/sg.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
        {
            "<space>ct",
            "<cmd>CodyToggle<CR>",
            "Toggle Cody",
        },
        {
            "<space>ch",
            "<cmd>CodyChat<CR>",
            "Cody Chat",
        },
        {
            "<space>ss",
            "<cmd>lua require('sg.extensions.telescope').fuzzy_search_results()<CR>",
            "Search Sourcegraph",
        },
    },
    build = "nvim -l build/init.lua",
    config = function()
        require('sg').setup({})
    end,

}
