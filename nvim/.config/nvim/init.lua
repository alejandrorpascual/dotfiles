if vim.g.vscode then
  return
end

require("utils")
require("settings")
require("config.lazy")
require("keymappings")
require("config.diagnostics")
