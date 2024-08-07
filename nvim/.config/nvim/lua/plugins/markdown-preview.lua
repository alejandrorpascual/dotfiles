return {
    {
        "iamcco/markdown-preview.nvim",
        enabled = function()
            if vim.g.is_win or vim.g.is_mac then
                return true
            end
            return false
        end,
        build = "cd app && npm install",
        -- ft = { "markdown", "codecompanion" },
        cmd = {
            "MarkdownPreview",
            "MarkdownPreviewStop",
            "MarkdownPreviewToggle",
        },
    },

}
