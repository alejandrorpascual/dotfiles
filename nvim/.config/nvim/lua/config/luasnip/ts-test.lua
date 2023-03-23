local ls = require("luasnip")
local fmt = require("luasnip.extras.fmt").fmt
local s = ls.snippet
local i = ls.insert_node

ls.add_snippets("typescript", {
    s(
        "test",
        fmt(
            [[
    test("{1}", () => {{
        // {2}
    }});
    ]],
            { i(1, "description"), i(2, "start writing...") }
        )
    ),
    s(
        "atest",
        fmt(
            [[
    test("{1}", async () => {{
        // {2}
    }});
    ]],
            { i(1, "description"), i(2, "start writing...") }
        )
    ),
})
