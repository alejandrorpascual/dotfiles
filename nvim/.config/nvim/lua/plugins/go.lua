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
        bind('v', '<leader>ga', require 'go.gopls'.change_signature, 'Go change signature')
        bind('n', '<leader>rt', ':GoTestSum<CR>', 'Go test current file')
        bind('n', '<leader>rw', ':GoTermClose<CR>', 'Go exit terminal')
        bind('n', '<leader>gf', ':GoTestFunc<CR>', 'Go exit terminal')
        bind('n', '<leader>gg', ':GoRun<CR>', 'Go exit terminal')
    end,
    event = { "CmdlineEnter" },
    ft = { "go", 'gomod' },
    build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
}
