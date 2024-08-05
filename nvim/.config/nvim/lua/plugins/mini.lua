return {
    {
        "echasnovski/mini.nvim",
        config = function()
            require("mini.ai").setup({
                search_method = 'cover_or_nearest'
            })
            require('mini.comment').setup()
            require('mini.icons').setup()
            require("mini.surround").setup({
                mappings = {
                    add = 'ys',        -- Add surrounding in Normal and Visual modes
                    delete = 'ds',     -- Delete surrounding
                    find = 'cf',       -- Find surrounding (to the right)
                    find_left = 'cF',  -- Find surrounding (to the left)
                    highlight = 'ch',  -- Highlight surrounding
                    replace = 'cs',    -- Replace surrounding
                    update_n_lines = 'cn', -- Update `n_lines`
                },
            })
        end,
    },
}
