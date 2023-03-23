local nightfox = require("nightfox")

nightfox.setup({
    options = {
        styles = {
            comments = "italic", -- change style of comments to be italic
            keywords = "bold", -- change style of keywords to be bold
            functions = "italic,bold", -- styles can be a comma separated list
        },
    },
    groups = {
        -- --     CmpItemAbbr = { fg = palette.subtle },
        -- --     CmpItemAbbrDeprecated = { fg = palette.highlight_inactive, style = 'strikethrough' },
        -- CmpItemAbbrMatch = { fg = "${green}", style = "bold" },
        -- -- CmpItemAbbrMatchFuzzy = { fg = "${green}", style = "bold" },
        -- -- CmpItemKind = { fg = "${cyan}", style = "italic" },
        -- -- CmpGhostText = { fg = "${cyan}", style = 'italic' },
        -- CmpItemMenu = { fg = "${comment}", style = "italic" },
    },
})

-- vim.cmd([[colorscheme dayfox]])
