-- Telescope mappings
local builtin = require("telescope.builtin")
local file_browser = require("telescope").extensions.file_browser.file_browser

local M = {}

function M.grep_prompt()
    require("telescope").extensions.live_grep_args.live_grep_args()
end

function M.find_notes()
    file_browser({
        prompt_title = " Note Browsing",
        cwd = "~/notes/",
    })
end

function M.find_plugin_dir()
    file_browser({
        prompt_title = "  Plugin Dir Browsing",
        cwd = vim.fn.stdpath("data") .. "/lazy",
    })
end

function M.file_explorer()
    file_browser({
        prompt_title = "  File Browser",
        path_display = { "shorten" },
        cwd = "~",
    })
end

-- grep Neovim source using cword
function M.grep_nvim_src()
    builtin.grep_string({
        results_title = "Neovim Source Code",
        path_display = { "smart" },
        search_dirs = {
            "~/vim-dev/sources/neovim/runtime/lua/vim/",
            "~/vim-dev/sources/neovim/src/nvim/",
        },
    })
end

function M.nvim_config()
    file_browser({
        prompt_title = " NVim Config Browse",
        cwd = "~/.config/nvim/",
    })
end

bind("n", "<Leader>ff", builtin.find_files)
bind("n", "<C-p>", builtin.git_files)
bind("n", "<Leader>F", function()
    builtin.find_files({ no_ignore = true, prompt_title = "All Files" })
end)

bind("n", "<Leader>fB", file_browser, "Telescope File Browser Project")
bind("n", "<Leader>fP", M.find_plugin_dir, "Telescope Plugin Dir Browser")
bind("n", "<Leader>fg", builtin.live_grep, "Telescope Grep")
bind("n", "<Leader>fb", builtin.buffers, "Telescope Buffers")
bind("n", "<Leader>fh", builtin.help_tags, "Telescope Help Tags")
bind("n", "<Leader>fc", builtin.commands, "Telescope Commands")
bind("n", "<Leader>fm", builtin.keymaps, "Telescope Keymaps")
bind("n", "<Leader>fy", builtin.symbols, "Telescope Symbols")
bind("n", "<Leader>fo", builtin.oldfiles, "Telescope Oldfiles")
bind("n", "<leader>ds", builtin.lsp_document_symbols, "Telescope Document Symbols")
bind("n", "<leader>ws", builtin.lsp_dynamic_workspace_symbols, "Telescope Workspace Symbols")
bind("n", "<Leader>em", "<cmd>Telescope emoji<cr>", "Telescope Emoji")
bind("n", "<Leader>cb", builtin.current_buffer_fuzzy_find, "Telescope Fuzzy Find Current Buffer")
bind("n", "<Leader><Leader>gs", builtin.git_status, "Telescope Git Status")
bind("n", "<Leader><Leader>gc", builtin.git_branches, "Telescope Git Branches")
bind("n", "<Leader><Leader>gl", builtin.git_commits, "Telescope Git Commits")
bind("n", '<Leader><Leader>"', "<cmd>Telescope neoclip<cr>", "Telescope Neoclip")
bind("n", ",g", builtin.diagnostics, "Telescope Diagnostics")
bind("n", ",i", builtin.lsp_implementations, "Telescope Implementations")
bind("n", ",d", builtin.lsp_definitions, "Telescope Definitions")
bind("n", ",r", builtin.lsp_references, "Telescope References")
bind("n", "<Leader>g", M.grep_prompt, "Telescope `rg` Prompt")
bind("n", "<Leader>nc", function()
    M.nvim_config()
end, "Telescope Nvim Config")

bind("n", "<Leader>fe", function()
    M.file_explorer()
end, "Telescope File Explorer")

bind("n", "<Leader>fn", function()
    M.find_notes()
end, "Telescope Find Notes")
bind("n", "<Leader>fd", function()
    M.grep_nvim_src()
end, "Telescope Grep Neovim Source")
-- bind("n", "<Leader>fs", [[<cmd> lua require'config.telescope'.search_snippets()<cr>]])
bind("n", "<Leader>tt", "<cmd>TodoTelescope<cr>")

-- remap to open the Telescope refactoring menu in visual mode
bind("v", "<leader>rr", "<Esc><cmd>lua require('telescope').extensions.refactoring.refactors()<CR>", {
    desc = "Telescope Refactoring",
})

-- zoxide
bind("n", "<Leader>z", ":lua require'telescope'.extensions.zoxide.list{}<CR>")
