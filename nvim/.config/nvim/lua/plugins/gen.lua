-- Minimal configuration
return {
    "David-Kunz/gen.nvim",
    enabled = true,
    opts = {
        model = "codestral:latest",
        display_mode = "split",
        show_model = true,
        show_promot = true,
    },
    config = function(_, opts)
        require("gen").setup(opts)
        vim.keymap.set({ 'n', 'v' }, '<leader>]', '<cmd>Gen<cr>', { desc = "Open Gen Chat" })
        vim.keymap.set('v', '<leader>]', '<cmd>Gen Enhance_Grammar_Spelling<CR>', { desc = "Open Gen Chat" })
        vim.keymap.set('v', '<leader>fx', '<cmd>Gen Fix_Code<CR>', { desc = "Open Gen Chat" })
        vim.keymap.set('v', '<leader>ex', '<cmd>Gen Explain_Code<CR>', { desc = "Open Gen Chat" })

        local prompts = require("gen").prompts

        prompts["Create_Regex"] = {
            prompt =
            "Create a regular expression for $filetype language that matches the following pattern:\n```$filetype\n$text\n```",
            replace = true,
            no_auto_close = false,
            extract = "```$filetype\n(.-)```",
        }

        prompts["Explain_Regex"] = {
            prompt = "Explain the following regular expression:\n```$filetype\n$text\n```",
            extract = "```$filetype\n(.-)```",
        }

        prompts["Write_JSDoc"] = {
            prompt = "Write JSDoc comments for the following $filetype code:\n```$filetype\n$text\n```",
        }

        prompts["Read_JSDoc"] = {
            prompt = "Read the following comment and create the $filetype code below it:\n```$filetype\n$text\n```",
            extract = "```$filetype\n(.-)```",
        }

        prompts["Unit_Test_React"] = {
            prompt =
            "Read the following $filetype code that includes some unit tests inside the 'describe' function. We are using Jest with React testing library, and the main component is reused by the tests via the customRender function. Detect if we have any missing unit tests and create them.\n```$filetype\n$text\n```",
            extract = "```$filetype\n(.-)```",
        }

        prompts["Code_Review"] = {
            prompt = "Review the following $filetype code and make concise suggestions:\n```$filetype\n$text\n```",
        }

        prompts["Explain_Code"] = {
            prompt = "Explain the following $filetype code in a very concise way:\n```$filetype\n$text\n```",
        }

        prompts["Fix_Code"] = {
            prompt = "Fix the following $filetype code:\n```$filetype\n$text\n```",
            replace = true,
            no_auto_close = false,
            extract = "```$filetype\n(.-)```",
        }
    end
}
