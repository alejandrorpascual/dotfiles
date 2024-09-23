local ls = require("luasnip")
local types = require("luasnip.util.types")

ls.config.set_config({
    history = false,
    region_check_events = "CursorMoved,CursorHold,InsertEnter",
    delete_check_events = "InsertLeave",
    ext_opts = {
        [types.choiceNode] = {
            active = {
                virt_text = { { "●", "Operator" } },
            },
        },
        [types.insertNode] = {
            active = {
                virt_text = { { "●", "Type" } },
            },
        },
    },
    enable_autosnippets = true,
})

local opts = { noremap = false, expr = true }
global.map("i", "<c-j>", "luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<c-j>'", opts)
global.map("i", "<c-k>", "luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev': '<c-k>'", opts)
global.map("s", "<c-j>", function()
    ls.jump(1)
end)
global.map("s", "<c-k>", function()
    ls.jump(-1)
end)

-- ls.filetype_extend("all", { "_" })
-- require("luasnip.loaders.from_vscode").lazy_load()
-- require("luasnip.loaders.from_vscode").load({
--   paths = { "~/.config/nvim/my-snippets" },
-- })
require("luasnip.loaders.from_snipmate").lazy_load()

require("config.luasnip.remix-run")
require("config.luasnip.ts-test")
require("config.luasnip.react")
require("config.luasnip.go")
