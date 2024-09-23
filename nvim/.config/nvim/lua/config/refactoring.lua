local refactoring = require("refactoring")
refactoring.setup({})

local wk = require("which-key")


bind("v", "<leader>re", ":Refactor extract<cr>", "Refactoring: Extract Function")
bind("v", "<leader>rf", ":Refactor extract_to_file<cr>", "Refactoring: Extract Function To File")
bind("v", "<leader>rv", ":Refactor extract_var<cr>", "Refactoring: Extract Variable")
bind("x", "<leader>ri", ":Refactor inline_var<cr>", "Refactoring: Inline Variable")
bind("n", "<leader>ri", ":Refactor inline_var<cr>", "Refactoring: Inline Variable")
-- Extract block doesn't need visual mode
bind("n", "<leader>rb", ":Refactor extract_block<cr>", "Refactoring: Extract Block")
bind("n", "<leader>rbf", ":Refactor extract_block_to_file", "Refactoring: Extract Block To File")
-- prompt for a refactor to apply when the remap is triggered
-- bind("v", "<leader>rr",
--     ":lua require('refactoring').select_refactor()"
--     , "Refactoring: Prompt Refactor")
--
vim.keymap.set("v", "<leader>rr",
    ":lua require('refactoring').select_refactor()")
