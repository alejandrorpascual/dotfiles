return {
    'MeanderingProgrammer/markdown.nvim',
    enabled = false,
    main = "render-markdown",
    opts = {},
    name = 'render-markdown', -- Only needed if you have another plugin named markdown.nvim
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' },     -- if you use the mini.nvim suite
    dependencies = {
        'nvim-treesitter/nvim-treesitter',
        'echasnovski/mini.icons',

    }, -- if you use standalone mini plugins
}
