if vim.g.vscode then
    return
end

require("utils")
require("settings")
require("config.lazy")
require("config.diagnostics")
require("keymappings")
