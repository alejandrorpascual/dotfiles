return {
    'Exafunction/codeium.vim',
    event = 'BufEnter',
    config = function()
        bind("n", "<space>ch", "<cmd>:call codeium#Chat()<CR>", "Codieum Chat")
    end
}
