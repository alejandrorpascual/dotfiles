return {
    "lewis6991/gitsigns.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function()
        local gs = require("gitsigns")
        gs.setup({
            numhl = true,      -- Toggle with `:Gitsigns toggle_numhl`
            linehl = false,    -- Toggle with `:Gitsigns toggle_linehl`
            word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
        })

        bind("n", "]f", gs.next_hunk, "Gitsigns next_hunk")
        bind("n", "[f", gs.prev_hunk, "Gitsigns prev_hunk")
        bind("n", "<Leader>hs", gs.stage_hunk, "Gitsigns stage_hunk")
        bind("n", "<Leader>hr", gs.reset_hunk, "Gitsigns reset_hunk")
        bind("n", "<Leader>hu", gs.undo_stage_hunk, "Gitsigns undo_stage_hunk")
        bind("n", "<Leader>hp", gs.preview_hunk, "Gitsigns preview_hunk")
        bind("n", "<Leader>hd", gs.diffthis, "Gitsigns diffthis")

        bind("v", "<Leader>hs", function()
            gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end, "[VISUAL] Gitsigns stage_hunk")
        bind("v", "<Leader>hr", function()
            gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end, "[VISUAL] Gitsigns reset_hunk")
    end,
}
