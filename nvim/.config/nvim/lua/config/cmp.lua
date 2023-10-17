print("CMP EXECUTED")
vim.o.completeopt = "menu,menuone,noselect,noinsert"
local api = vim.api

local function get_module(module_str)
    local ok, module = pcall(require, module_str)
    if not ok then
        return nil
    end
    return module
end

local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local function feed(key, mode)
    api.nvim_feedkeys(t(key), mode or "", true)
end

local lspkind = require("lspkind")
lspkind.init()

local cmp = require("cmp")
if not cmp then
    return
end


local function tab(fallback)
    local luasnip = get_module("luasnip")
    local copilot_keys = vim.fn["copilot#Accept"]()
    if cmp.visible() then
        cmp.select_next_item()
    elseif copilot_keys ~= "" then -- prioritise copilot over snippets
        -- Copilot keys do not need to be wrapped in termcodes
        api.nvim_feedkeys(copilot_keys, "i", true)
    elseif luasnip and luasnip.expand_or_locally_jumpable() then
        luasnip.expand_or_jump()
    elseif api.nvim_get_mode().mode == "c" then
        fallback()
    else
        feed("<Plug>(Tabout)")
    end
end

local function shift_tab(fallback)
    local luasnip = get_module("luasnip")
    if cmp.visible() then
        cmp.select_prev_item()
    elseif luasnip and luasnip.jumpable(-1) then
        luasnip.jump(-1)
    elseif api.nvim_get_mode().mode == "c" then
        fallback()
    else
        local copilot_keys = vim.fn["copilot#Accept"]()
        if copilot_keys ~= "" then
            feed(copilot_keys, "i")
        else
            feed("<Plug>(Tabout)")
        end
    end
end


cmp.setup({
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        -- ["<Tab>"] = cmp.mapping(tab, { "i", "c" }),
        -- ["<S-Tab>"] = cmp.mapping(shift_tab, { "i", "c" }),
        -- s
        -- ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),

        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        -- ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
        ["<C-Space>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true })
            else
                cmp.complete()
            end
        end, { "i", "s" }),
        -- ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
        -- ["<C-e>"] = cmp.mapping({
        --     i = cmp.mapping.abort(),
        --     c = cmp.mapping.close(),
        -- }),
        -- ["<CR>"] = cmp.mapping.confirm({
        --     select = true,
        --     behavior = cmp.SelectBehavior.Replace,
        -- }),
    }),
    sources = cmp.config.sources({
        { name = "jupynium", priority = 1000 },
        { name = "nvim_lsp", priority = 100 },
        { name = "luasnip", priority = 90 },
        { name = "buffer", priority = 80 },
        { name = "path", priority = 70 },
        { name = "nvim_lua", priority = 60 },
        { name = "treesitter", priority = 50 },
        { name = "emoji", priority = 40 },
        { name = "calc", priority = 30 },
        { name = "copilot", priority = 20 },
    }),
    sorting = {
        priority_weight = 2,
        comparators = {
            cmp.config.compare.score,
            cmp.config.compare.recently_used,
            cmp.config.compare.locality,
            cmp.config.compare.offset,
            cmp.config.compare.exact,
            cmp.config.compare.kind,
            cmp.config.compare.sort_text,
            cmp.config.compare.length,
            cmp.config.compare.order,
        },
    },
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

local autocomplete_group = vim.api.nvim_create_augroup("vimrc_autocompletion", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "sql", "mysql", "plsql" },
    callback = function()
        cmp.setup.buffer({ sources = { { name = "vim-dadbod-completion" } } })
    end,
    group = autocomplete_group,
})
