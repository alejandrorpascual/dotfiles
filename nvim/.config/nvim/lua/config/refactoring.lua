local refactoring = require("refactoring")
refactoring.setup({})

bind("v", "<leader>re", function()
    refactoring.refactor("Extract Function")
end, "Refactoring: Extract Function")

bind("v", "<leader>rf", function()
    refactoring.refactor("Extract Function To File")
end, "Refactoring: Extract Function To File")

bind("v", "<leader>rv", function()
    refactoring.refactor("Extract Variable")
end, "Refactoring: Extract Variable")

bind("v", "<leader>ri", function()
    refactoring.refactor("Inline Variable")
end, "Refactoring: Inline Variable")

-- Extract block doesn't need visual mode
bind("n", "<leader>rb", function()
    refactoring.refactor("Extract Block")
end, "Refactoring: Extract Block")

bind("n", "<leader>rbf", function()
    refactoring.refactor("Extract Block To File")
end, "Refactoring: Extract Block To File")

-- Inline variable can also pick up the identifier currently under the cursor without visual mode
bind("n", "<leader>ri", function()
    refactoring.refactor("Inline Variable")
end, "Refactoring: Inline Variable")

-- prompt for a refactor to apply when the remap is triggered
bind("v", "<leader>rr", function()
    refactoring.prompt_refactor()
end, "Refactoring: Prompt Refactor")
