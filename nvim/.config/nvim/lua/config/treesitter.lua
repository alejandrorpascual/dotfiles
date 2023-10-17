-- many of this is taken from:
-- https://alpha2phi.medium.com/neovim-tips-for-a-better-coding-experience-part-2-3b6a5a09d7c8

require("nvim-treesitter.configs").setup({
    auto_install = true,
    ensure_installed = {
        "bash",
        "javascript",
        "typescript",
        "lua",
        "json",
    },
    highlight = {
        enable = true,
        use_languagetree = true,
        disable = { "html" },
    },
    indent = {
        enable = true,
        disable = { "python", "blade" },
    },
    rainbow = {
        enable = true,
        extended_mode = true, -- Highlight also non-parentheses delimiters
        max_file_lines = 1000,
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
        },
    },
    playground = {
        enable = true,
        disable = {},
        updatetime = 25,
        persist_queries = false,
    },
    context_commentstring = {
        enable = true,
        enable_autocmd = false,
    },
    textobjects = {
        select = {
            enable = true,
            keymaps = {
                ["aa"] = "@parameter.outer",
                ["ia"] = "@parameter.inner",
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                ["ic"] = "@class.inner",
                ["ii"] = "@conditional.inner",
                ["ai"] = "@conditional.outer",
                ["il"] = "@loop.inner",
                ["al"] = "@loop.outer",
                ["ao"] = "@comment.outer",
            },
        },
        -- swap parameters function(x, y) -> function(y, x)
        swap = {
            enable = true,
            swap_next = { ["<leader>xp"] = "@parameter.inner" },
            swap_previous = { ["<leader>xP"] = "@parameter.inner" },
        },
        move = {
            enable = true,
            set_jumps = true,
            goto_next_start = {
                ["]m"] = "@function.outer",
                ["]]"] = "@class.outer",
            },
            goto_next_end = {
                ["]M"] = "@function.outer",
                ["]["] = "@class.outer",
            },
            goto_previous_start = {
                ["[m"] = "@function.outer",
                ["[["] = "@class.outer",
            },
            goto_previous_end = {
                ["[M"] = "@function.outer",
                ["[]"] = "@class.outer",
            },
            goto_next = {
                ["]i"] = "@conditional.inner",
                ["]l"] = "@loop.outer",
                ["]o"] = "@comment.outer",
            },
            goto_previous = {
                ["[i"] = "@conditional.inner",
                ["[l"] = "@loop.outer",
                ["[o"] = "@comment.outer",
            },
        },
        -- peek at function definitions
        lsp_interop = {
            enable = true,
            border = "none",
            peek_definition_code = {
                ["<leader>pf"] = "@function.outer",
                ["<leader>pc"] = "@class.outer",
            },
        },
        textsubjects = {
            enable = true,
            keymaps = {
                ["."] = "textsubjects-smart",
                [";"] = "textsubjects-container-outer",
            },
        },
    },
})
