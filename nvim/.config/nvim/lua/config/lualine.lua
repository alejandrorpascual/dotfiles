local lualine = require("lualine")
local separator = { '"▏"', color = "StatusLineNonText" }

lualine.setup({
    options = {
        icons_enabled = true,
        theme = global.lualineTheme,
        globalstatus = true,
        separator = separator,
    },
    sections = {
        lualine_a = { "mode" },
        lualine_b = {
            "branch",
            "diff",
            { '"▏"' },
            '" " .. tostring(#vim.tbl_keys(vim.lsp.buf_get_clients()))',
            { "diagnostics", sources = { "nvim_diagnostic" } },
        },
        lualine_c = {
            {
                "filename",
                path = 0,
            },
        },
        lualine_x = {
            {
                "diagnostics",
                sources = { "nvim_diagnostic" },
                symbols = {
                    error = " ",
                    warn = " ",
                    info = " ",
                    hint = " ",
                },
            },
            "encoding",
            "filetype",
        },
        lualine_y = { "progress" },
        lualine_z = { "location" },
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
    },
    tabline = {},
    extensions = { "fugitive" },
})

-- vim.opt.ls = 2
