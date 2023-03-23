local ls = require("luasnip")
local fmt = require("luasnip.extras.fmt").fmt
local s = ls.snippet
local i = ls.insert_node

ls.add_snippets("typescriptreact", {
    s(
        "loader",
        fmt(
            [[
    export async function loader({{request, {1}}}: DataFunctionArgs) {{
        // {2}
    }}
    ]],
            { i(1), i(2) }
        )
    ),
    s(
        "action",
        fmt(
            [[
    export async function action({{request, {1}}}: DataFunctionArgs) {{
        // {2}
    }}
    ]],
            { i(1), i(2) }
        )
    ),
    s(
        "component",
        fmt(
            [[
    export default function Component({{ {2} }}: {1}) {{
        return (
            {3}
        );
    }}
    ]],
            { i(1, "Props"), i(2), i(3, "<div></div>") }
        )
    ),
})
