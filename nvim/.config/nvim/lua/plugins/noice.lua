return {
    "folke/noice.nvim",
    event = "VeryLazy",
    enabled = true,
    dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" },
    config = function(_, opts)
        require("noice").setup(opts)
        local wk = require("which-key")

        wk.add({
            { "<leader>n",  group = "Noice", },
            { "<leader>nl", function() require('noice').cmd('last') end,      desc = "Last" },
            { "<leader>nh", function() require('noice').cmd('history') end,   desc = "History" },
            { "<leader>nt", function() require('noice').cmd('telescope') end, desc = "Telescope" },
        })
    end,
    opts = {
        routes = {
            {
                view = "split",
                filter = { event = "msg_show", min_height = 20 },
            },
            {
                filter = { event = 'msg_show', kind = '', find = 'written' },
                opts = { skip = true },
            },
            {
                filter = { event = 'msg_show', kind = '', find = 'Modified' },
                opts = { skip = true },
            },
            {
                filter = { event = 'msg_show', kind = '', find = 'lines' },
                opts = { skip = true },
            },
        },

        lsp = {
            hover = {
                enabled = false,
            }
        },
        --     -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        --     override = {
        --         ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        --         ["vim.lsp.util.stylize_markdown"] = true,
        --         ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
        --     },
        -- },
        -- you can enable a preset for easier configuration
        presets = {
            bottom_search = true,         -- use a classic bottom cmdline for search
            command_palette = true,       -- position the cmdline and popupmenu together
            long_message_to_split = true, -- long messages will be sent to a split
            inc_rename = false,           -- enables an input dialog for inc-rename.nvim
            lsp_doc_border = false,       -- add a border to hover docs and signature help
        },
        views = {
            cmdline_popup = {
                position = {
                    row = 5,
                    col = "50%",
                },
                size = {
                    width = 60,
                    height = "auto",
                },
            },
            popupmenu = {
                relative = "editor",
                position = {
                    row = 8,
                    col = "50%",
                },
                size = {
                    width = 60,
                    height = 10,
                },
                border = {
                    style = "rounded",
                    padding = { 0, 1 },
                },
                win_options = {
                    winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
                },
            },
        },
    }
}
