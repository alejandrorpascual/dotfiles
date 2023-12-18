return {
    "numToStr/Comment.nvim",
    config = function()
        require("Comment").setup({
            pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
        })
    end,
    dependencies = "JoosepAlviste/nvim-ts-context-commentstring",
}


-- context_commentstring nvim-treesitter module is deprecated, use require('ts_context_commentstring').setup {} and set vim.g.skip_ts_context_commentstring_module = true to speed up loading instead.
-- This feature will be removed in ts_context_commentstring version in the future (see https://github.com/JoosepAlviste/nvim-ts-context-commentstring/issues/82 for more info)
