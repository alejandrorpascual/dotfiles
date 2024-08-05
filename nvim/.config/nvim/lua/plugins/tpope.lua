return {
    {
        "tpope/vim-surround",
        config = function()
            bind("v", "A", "<Plug>VSurround", "VSurround")
        end,
    },
    "tpope/vim-repeat",
    "tpope/vim-abolish",
    "tpope/vim-rhubarb",
    "tpope/vim-scriptease",
    "tpope/vim-eunuch",
    -- "tpope/vim-liquid",
    {
        "tpope/vim-fugitive",
        keys = {
            { "<leader>gs",  "<cmd>Git<cr>",        desc = "Git status" },
            { "<leader>gw",  "<cmd>Gwrite<cr>",     desc = "Git write" },
            { "<leader>gc",  "<cmd>Git commit<cr>", desc = "Git commit" },
            { "<leader>gpl", "<cmd>Git pull<cr>",   desc = "Git pull" },
        },
    },
}
