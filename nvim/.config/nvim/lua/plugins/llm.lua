return {
    "gsuuon/llm.nvim",
    enabled = false,
    config = function()
        require("llm").setup({})
        require("llm.providers.openai").initialize({
            max_tokens = 120,
            temperature = 0.7,
            model = "gpt-4",
        })
    end,
}
