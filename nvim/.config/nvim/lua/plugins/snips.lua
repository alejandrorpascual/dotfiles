return {
    { "honza/vim-snippets",    event = { "InsertEnter" } },
    { "cstrap/python-snippets" },
    {
        "L3MON4D3/LuaSnip",
        dependencies = {
            "hrsh7th/cmp-vsnip",
            "hrsh7th/vim-vsnip",
            {
                'mireq/luasnip-snippets',
                init = function()
                    -- Mandatory setup function
                    require('luasnip_snippets.common.snip_utils').setup()
                end

            }
        },
        version = "v2.*",
        config = function()
            require("config.luasnip")
        end,
    },
    { "golang/vscode-go" },
    { "rust-lang/vscode-rust" },
}
