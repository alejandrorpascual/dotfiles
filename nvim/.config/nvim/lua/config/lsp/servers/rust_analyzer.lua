local lsp_attach = require('config.lsp.attach')
local lsp_flags = require('config.lsp.flags')

return function(ops)
  return vim.tbl_extend("force", {
      on_attach = lsp_attach,
      flags = lsp_flags,
      settings = {
        ["rust-analyzer"] = {
          checkOnSave = {
            allFeatures = true,
            overrideCommand = {
              "cargo",
              "clippy",
              "--workspace",
              "--message-format=json",
              "--all-targets",
              "--all-features",
            },
          },
        },
      },
    }, ops)
end
