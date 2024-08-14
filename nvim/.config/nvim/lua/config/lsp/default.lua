return {
    mason = {
        enable = true,
        auto_install = false,
    },
    servers = {
        prismals = { enable = true },
        jsonls = { enable = true },
        lua_ls = { enable = true },
        rust_analyzer = { enable = true },
        tailwindcss = { enable = true },
        -- tsserver = { enable = true },
        htmx = { enable = true },
        bashls = { enable = true },
    },
    default_options = function(options)
        return vim.tbl_deep_extend("force", {
            on_attach = require("config.lsp.attach"),
            flags = require("config.lsp.flags"),
        }, options)
    end,

}
