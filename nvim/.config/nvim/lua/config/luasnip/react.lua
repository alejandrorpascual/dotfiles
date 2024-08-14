local ls = require("luasnip")
local fmt = require("luasnip.extras.fmt").fmt
local s = ls.snippet
local i = ls.insert_node
local f = ls.function_node

local function kebab_to_camel(str)
    local words = {}
    for word in string.gmatch(str, "[^-]+") do
        table.insert(words, word)
    end

    words[1] = string.upper(words[1]:sub(1, 1)) .. words[1]:sub(2)

    for j = 2, #words do
        words[j] = string.lower(words[j]:sub(1, 1)) .. words[j]:sub(2)
    end

    return table.concat(words)
end

ls.add_snippets("typescriptreact", {
    s(
        "rdc",
        fmt([[
        export default function {}() {{
          return ({});
        }}
        ]],
            {
                f(function()
                    local file_name = vim.fn.expand("%:t:r")
                    return kebab_to_camel(file_name)
                end),
                i(1, "<div></div>")
            }
        )
    )
})
