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
                require("noice").api.status.message.get_hl,
                cond = require("noice").api.status.message.has,
            },
            {
                require("noice").api.status.command.get,
                cond = require("noice").api.status.command.has,
                color = { fg = "#ff9e64" },
            },
            {
                require("noice").api.status.mode.get,
                cond = require("noice").api.status.mode.has,
                color = { fg = "#ff9e64" },
            },
            {
                require("noice").api.status.search.get,
                cond = require("noice").api.status.search.has,
                color = { fg = "#ff9e64" },
            },
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
