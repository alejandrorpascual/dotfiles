return {
    {
        'nvimdev/lspsaga.nvim',
        config = function()
            require('config.lspsaga')
        end,
        dependencies = {
            'nvim-treesitter/nvim-treesitter', -- optional,
            'nvim-tree/nvim-web-devicons'      -- optional
        }
    }
}
