if vim.g.vscode then
    local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
    if not (vim.uv or vim.loop).fs_stat(lazypath) then
        local lazyrepo = "https://github.com/folke/lazy.nvim.git"
        local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
        if vim.v.shell_error ~= 0 then
            vim.api.nvim_echo({
                { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
                { out,                            "WarningMsg" },
                { "\nPress any key to exit..." },
            }, true, {})
            vim.fn.getchar()
            os.exit(1)
        end
    end
    vim.opt.rtp:prepend(lazypath)

    -- Make sure to setup `mapleader` and `maplocalleader` before
    -- loading lazy.nvim so that mappings are correct.
    -- This is also a good place to setup other settings (vim.opt)
    vim.g.mapleader = " "
    vim.g.maplocalleader = "\\"

    -- Setup lazy.nvim
    require("lazy").setup({
        spec = {
            "nvim-treesitter/nvim-treesitter",
            {
                'echasnovski/mini.ai',
                version = false,
                dependencies = { 'nvim-treesitter/nvim-treesitter' }
            },
            { "echasnovski/mini.comment", version = false },
            {
                'echasnovski/mini.surround',
                version = '*',
                config = function()
                    require('mini.surround').setup({
                        mappings = {
                            add = 'ys',            -- Add surrounding in Normal and Visual modes
                            delete = 'ds',         -- Delete surrounding
                            find = 'sf',           -- Find surrounding (to the right)
                            find_left = 'sF',      -- Find surrounding (to the left)
                            highlight = 'sh',      -- Highlight surrounding
                            replace = 'cs',        -- Replace surrounding
                            update_n_lines = 'sn', -- Update `n_lines`

                            suffix_last = 'l',     -- Suffix to search with "prev" method
                            suffix_next = 'n',     -- Suffix to search with "next" method
                        },
                    })
                end
            },
            {
                "folke/flash.nvim",
                event = "VeryLazy",
                ---@type Flash.Config
                opts = {},
                -- stylua: ignore
                keys = {
                    { "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
                    { "S",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
                    { "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
                    { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
                    { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
                },
            }
        },
        -- Configure any other settings here. See the documentation for more details.
        -- colorscheme that will be used when installing plugins.
        install = { colorscheme = { "habamax" } },
        -- automatically check for plugin updates
        checker = { enabled = true },
    })

    -- local function print_plugins()
    --     local plugins = require("lazy").plugins()
    --     for _, plugin in pairs(plugins) do
    --         if plugin.url ~= nil then
    --             print(plugin.url .. "\n")
    --         end
    --     end
    -- end
    -- print_plugins()

    return
end

require("utils")
require("settings")
require("config.lazy")
require("config.diagnostics")
require("keymappings")
