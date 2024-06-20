return {
    'declancm/maximize.nvim',
    config = function()
        bind("n", "<leader><leader>z", "<cmd>lua require('maximize').toggle()<CR>", "Toggle Maximize")
    end
}
