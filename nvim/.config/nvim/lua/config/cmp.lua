vim.o.completeopt = "menu,menuone,noselect,noinsert"
vim.opt.shortmess:append "c"



local lspkind = require("lspkind")
lspkind.init()

local cmp = require("cmp")
if not cmp then
    return
end

cmp.setup({
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },
    mapping = {
        ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }), -- previous suggestion
        ["<C-e>"] = cmp.mapping.close(),
        ["<C-Space>"] = cmp.mapping(function()
            if cmp.visible() then
                cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true })
            else
                cmp.complete()
            end
        end, { "i", "s" }),
    },
    sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "cody" },
        { name = "luasnip", },
        { name = "buffer", },
        { name = "path", },
    }),
    formatting = {
        fields = { "abbr", "kind", "menu" },
        format = lspkind.cmp_format({
            with_text = true,
            maxwidth = 50,
            menu = {
                buffer = "[buf]",
                nvim_lsp = "[lsp]",
                nvim_lua = "[api]",
                path = "[path]",
                cmdline = "[Command]",
                luasnip = "[Luasnip]",
                ["vim-dadbod-completion"] = "[DB]",
            },
        }),
    },
    experimental = {
        native_menu = false,
        ghost_text = false,
    },
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
--
cmp.setup.cmdline("/", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = "buffer" },
    },
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        completion = { autocomplete = false },
        { name = "path" },
    }, {
        { name = "cmdline" },
    }),
})

cmp.setup.filetype({ "sql" }, {
    sources = {
        { name = "vim-dadbod-completion" },
        { name = "buffer" },
    },
})
