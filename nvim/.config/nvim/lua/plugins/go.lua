return {
    "ray-x/go.nvim",
    dependencies = { -- optional packages
        "ray-x/guihua.lua",
        "neovim/nvim-lspconfig",
        "nvim-treesitter/nvim-treesitter",
    },
    config = function()
        require("go").setup({
            -- test_runner = 'gotestsum',
            run_in_floaterm = true,
            lsp_keymaps = false,
        })

        local wk = require("which-key")
        wk.add({
            { "<leader>r",          group = "Go Nvim 1" },
            { "<leader>rt",         ":GoTest<CR>",                       desc = "Go test current file" },
            { "<leader><leader>rt", ":GoTestSum<CR>",                    desc = "Go test current file" },
            { "<leader>rw",         ":GoTermClose<CR>",                  desc = "Go exit terminal" },
            { "<leader>g",          group = "Go Nvim 2" },
            { "<leader>gg",         ":GoRun ./...<CR>",                  desc = "Go run" },
            { "<leader>gf",         ":GoTestFunc<CR>",                   desc = "Go test function" },
            { "<leader>ga",         require 'go.gopls'.change_signature, desc = 'Go change signature', mode = { "v" } },
        })

        bind('v', '<leader>ga', require 'go.gopls'.change_signature, 'Go change signature')
    end,
    event = { "CmdlineEnter" },
    ft = { "go", 'gomod' },
    build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
}
