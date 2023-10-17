return {

    -- blade
    { "jwalton512/vim-blade" },

    -- color stuff
    { "tjdevries/colorbuddy.nvim" },

    -- convert colors
    { "amadeus/vim-convert-color-to" },

    -- for registers, marks, and keymaps

    -- for list of diagnostics
    "folke/lsp-colors.nvim",

    -- navigation
    { "christoomey/vim-tmux-navigator" },

    -- Pair movements
    { "andymass/vim-matchup" },

    -- Jump to the last location when opening a file
    { "farmergreg/vim-lastplace" },

    -- Automatically create parent directories when creating a new file
    { "jessarcher/vim-heritage" },

    -- Text objects for HTML attributes [ax, ix]
    {
        "whatyouhide/vim-textobj-xmlattr",
        dependencies = { "kana/vim-textobj-user" },
    },

    -- better text objects -> di'
    { "wellle/targets.vim" },

    -- autoclose
    { "alvan/vim-closetag" },

    -- python indentation
    { "Vimjas/vim-python-pep8-indent" },

    -- laravel tinker in vim
    {
        "jesseleite/vim-tinkeray",
        keys = { { "<leader>to", "<cmd>TinkerayOpen<cr>", desc = "Open Tinkeray" } },
    },

    -- { "p00f/nvim-ts-rainbow" },

    { "numToStr/FTerm.nvim" },

    -- twoslash for typescript
    { "marilari88/twoslash-queries.nvim" },

    -- jsDoc
    { "heavenshell/vim-jsdoc" },

    -- text motions
    { "tommcdo/vim-exchange" }, -- cxiw ., cxx ., cxc

    -- emojis
    { "junegunn/vim-emoji" },

    { "kyuhi/vim-emoji-complete" }, -- use it with <C-X><C-E>

    -- Markdown addon
    { "npxbr/glow.nvim" },
    { "godlygeek/tabular" },
    { "plasticboy/vim-markdown" },

    -- markdown support
    { "iamcco/markdown-preview.nvim" },


    -- Automatically fix indentation when pasting code
    {
        "sickill/vim-pasta",
        config = function()
            vim.g.pasta_disabled_filetypes = { "fugitive" }
        end,
    },

    {
        "simrat39/symbols-outline.nvim",
        cmd = "SymbolsOutline",
        keys = { { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
        config = function()
            require("symbols-outline").setup()
        end,
    },

    -- registers
    {
        "AckslD/nvim-neoclip.lua",
        dependencies = { "tami5/sqlite.lua", module = "sqlite" },
        config = function()
            require("neoclip").setup()
        end,
    },


    -- auto-pairs
    {
        "windwp/nvim-autopairs",
        config = function()
            require("config.autopairs")
        end,
    },

    -- emmet
    {
        "mattn/emmet-vim",
        event = "BufEnter",
    },

    -- Split arrays and methods onto multiple lines, or join them back up [gS and gJ]
    {
        "Wansmer/treesj",
        keys = {
            { "<leader>J", "<cmd>TSJToggle<cr>", desc = "Join Toggle" },
        },
        opts = { use_default_keymaps = false, max_join_length = 150 },
    },

    -- {
    --     "folke/noice.nvim",
    --     config = function()
    --         require("noice").setup({
    --             lsp = {
    --                 -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
    --                 override = {
    --                     ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
    --                     ["vim.lsp.util.stylize_markdown"] = true,
    --                     ["cmp.entry.get_documentation"] = true,
    --                 },
    --             },
    --             -- you can enable a preset for easier configuration
    --             presets = {
    --                 bottom_search = true, -- use a classic bottom cmdline for search
    --                 command_palette = true, -- position the cmdline and popupmenu together
    --                 long_message_to_split = true, -- long messages will be sent to a split
    --                 inc_rename = false, -- enables an input dialog for inc-rename.nvim
    --                 lsp_doc_border = false, -- add a border to hover docs and signature help
    --             },
    --         })
    --     end,
    --     dependencies = {
    --         -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    --         "MunifTanjim/nui.nvim",
    --         -- OPTIONAL:
    --         --   `nvim-notify` is only needed, if you want to use the notification view.
    --         --   If not available, we use `mini` as the fallback
    --         "rcarriga/nvim-notify",
    --     },
    -- },
}
