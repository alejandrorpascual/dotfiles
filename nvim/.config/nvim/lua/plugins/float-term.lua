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
    config = function()
        vim.g.floaterm_width = 0.85
        vim.g.floaterm_height = 0.85

        customize()

        bind("n", "<leader>lg", ":FloatermNew lazygit<CR>")
        bind("t", "<C-q>", [[<C-\><C-n>:FloatermToggle<CR>]])
        bind("n", "<C-q>", ":FloatermToggle<CR>")
        bind("n", "<C-t>", ":FloatermNew --wintype=vsplit --width=0.4<CR>")
        bind("n", "<leader><leader>t", ":FloatermNew --wintype=split --height=0.3<CR>")
        bind("n", "<leader><leader>n", ":FloatermNext<CR>")
        bind("n", "<leader><leader>p", ":FloatermPrev<CR>")
    end,
}
