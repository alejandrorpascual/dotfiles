return {
    "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    enabled = false,
    config = function()
        require("chatgpt").setup({
            openai_params = {
                -- model = "gpt-3.5-turbo",
                model = "gpt-4",
                frequency_penalty = 0,
                presence_penalty = 0,
                max_tokens = 300,
                temperature = 0,
                top_p = 1,
                n = 1,
            },
        })
    end,
    dependencies = {
        "MunifTanjim/nui.nvim",
        "nvim-lua/plenary.nvim",
    },
}
