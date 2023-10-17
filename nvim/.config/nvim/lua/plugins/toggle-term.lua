return {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
        require("toggleterm").setup({
            size = function(term)
                if term.direction == "horizontal" then
                    return 15
                elseif term.direction == "vertical" then
                    return vim.o.columns * 0.4
                end
            end,
            open_mapping = [[<c-q>]],
            insert_mappings = true,
            -- hide_numbers = true,
            -- shade_filetypes = {},
            -- shade_terminals = true,
            -- shading_factor = 1,
            -- start_in_insert = true,
            -- persist_size = true,
            -- direction = "horizontal",
            -- close_on_exit = true,
            -- shell = vim.o.shell,
        })

        -- local Terminal = require("toggleterm.terminal").Terminal
        -- bind("n", "<C-t>", function()
        --     Terminal:new({
        --         direction = "vertical",
        --     }):toggle()
        -- end)
        -- bind("n", "<Leader><Leader>t", function()
        --     Terminal:new({
        --         direction = "horizontal",
        --     }):toggle()
        -- end)
        bind("n", "<C-t>", "<Cmd>ToggleTerm direction=vertical<CR>", "toggle vertical terminal")
        bind("n", "<Leader><Leader>t", "<Cmd>ToggleTerm direction=horizontal<CR>", "toggle horizontal terminal")
        -- toggle float terminal
        bind("n", "<Leader>qt", "<Cmd>ToggleTerm direction=float<CR>", "float terminal")
    end,
}
