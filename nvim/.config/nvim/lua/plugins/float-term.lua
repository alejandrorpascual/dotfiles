-- pass true if you want no borders
local isOn = false
local customize = function()
    isOn = isOn or false

    if not isOn then
        return
    end

    if vim.g.colors_name == "nightfox" then
        vim.cmd([[
            highlight link Floaterm CursorLine
            highlight link FloatermBorder @parameter
        ]])
    end

    if vim.g.colors_name == "dayfox" then
        vim.cmd([[
          highlight link Floaterm CursorLine
          highlight link FloatermBorder Function
        ]])
    end
end

return {
    "voldikss/vim-floaterm",
    enabled = false,
    config = function()
        vim.g.floaterm_width = 0.85
        vim.g.floaterm_height = 0.85

        customize()

        bind("n", "<leader>lg", ":FloatermNew lazygit<CR>", { desc = "Floaterm Lazygit" })
        bind("t", "<C-q>", [[<C-\><C-n>:FloatermToggle<CR>]], { desc = "Floaterm Toggle in TERM mode" })
        bind("n", "<C-q>", ":FloatermToggle<CR>", { desc = "Floaterm Toggle in NORMAL mode" })
        bind("n", "<C-t>", ":FloatermNew --wintype=vsplit --width=0.4<CR>", { desc = "Floaterm New in Vertical Split" })
        bind(
            "n",
            "<leader><leader>t",
            ":FloatermNew --wintype=split --height=0.3<CR>",
            { desc = "Floaterm New in Horizontal Split" }
        )
        bind("n", "<leader><leader>n", ":FloatermNext<CR>", { desc = "Floaterm Next" })
        bind("n", "<leader><leader>p", ":FloatermPrev<CR>", { desc = "Floaterm Prev" })
    end,
}
