return {
    "Bryley/neoai.nvim",
    enabled = false,
    dependencies = {
        "MunifTanjim/nui.nvim",
    },
    cmd = {
        "NeoAI",
        "NeoAIOpen",
        "NeoAIClose",
        "NeoAIToggle",
        "NeoAIContext",
        "NeoAIContextOpen",
        "NeoAIContextClose",
        "NeoAIInject",
        "NeoAIInjectCode",
        "NeoAIInjectContext",
        "NeoAIInjectContextCode",
    },
    -- keys = {
    --     { "<leader>as", desc = "summarize text" },
    --     { "<leader>ag", desc = "generate git message" },
    -- },
    config = function()
        require("neoai").setup({
            ui = {
                width = 40, -- As percentage eg. 30%
                output_popup_height = 80, -- As percentage eg. 80%
            },
            models = {
                {
                    name = "openai",
                    model = "gpt-4",
                    params = nil,
                },
            },
        })
    end,
}
