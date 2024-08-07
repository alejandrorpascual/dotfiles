-- Telescope mappings
local builtin = require("telescope.builtin")
local file_browser = require("telescope").extensions.file_browser.file_browser

local M = {}

function M.grep_prompt()
    require("telescope").extensions.live_grep_args.live_grep_args()
end

function M.find_notes()
    file_browser({
        prompt_title = " Obsidian Browsing",
        cwd = "~/Obsidian/vaults",
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

local opts = {
    layout_strategy = "vertical",
    layout_config = { width = 0.65, prompt_position = "top" },
    sorting_strategy = "ascending"
}

bind("n", "<Leader>ff", function()
    builtin.find_files(opts)
end, "Telescope Find Files")
bind("n", "<Leader>fb", function()
    builtin.buffers(opts)
end, "Telescope Buffers")
bind("n", "<leader><leader>s", function()
    builtin.lsp_document_symbols(opts)
end, "Telescope Document Symbols")

-- Egrepify
bind("n", "<Leader>gj", ":Telescope egrepify<cr>", "Telescope egrepify")

bind("n", "<Leader>gno", function()
    require("telescope").extensions.egrepify.egrepify({ cwd = "~/obsidian/vaults/old" })
end, "Telescope egrepify obsidian")

bind("n", "<Leader>gnp", function()
    require("telescope").extensions.egrepify.egrepify({ cwd = "~/obsidian/vaults/personal" })
end, "Telescope egrepify obsidian")


bind("n", ",g", function()
    builtin.diagnostics(opts)
end, "Telescope Diagnostics")
bind("n", ",i", function()
    builtin.lsp_implementations(opts)
end, "Telescope Implementations")
bind("n", ",d", function()
    builtin.lsp_definitions(opts)
end, "Telescope Definitions")
bind("n", ",r", function()
    builtin.lsp_references(opts)
end, "Telescope References")

bind("n", "<C-p>", builtin.git_files, "Telescope Git Files")
bind("n", "<Leader>F", function()
    builtin.find_files({ no_ignore = true, prompt_title = "All Files" })
end, "Telescope Find All Files")

bind("n", "<Leader>fB", file_browser, "Telescope File Browser Project")
bind("n", "<Leader>fP", M.find_plugin_dir, "Telescope Plugin Dir Browser")
bind("n", "<Leader>fg", builtin.live_grep, "Telescope Grep")
bind("n", "<Leader>fh", builtin.help_tags, "Telescope Help Tags")
bind("n", "<Leader>fc", builtin.commands, "Telescope Commands")
bind("n", "<Leader>fm", builtin.keymaps, "Telescope Keymaps")
bind("n", "<Leader>fy", builtin.symbols, "Telescope Symbols")
bind("n", "<Leader>fo", builtin.oldfiles, "Telescope Oldfiles")
bind("n", "<leader>ws", builtin.lsp_dynamic_workspace_symbols, "Telescope Workspace Symbols")
bind("n", "<Leader>em", "<cmd>Telescope emoji<cr>", "Telescope Emoji")
bind("n", "<Leader>cb", builtin.current_buffer_fuzzy_find, "Telescope Fuzzy Find Current Buffer")
bind("n", "<Leader><Leader>gs", builtin.git_status, "Telescope Git Status")
bind("n", "<Leader><Leader>gc", builtin.git_branches, "Telescope Git Branches")
bind("n", "<Leader><Leader>gl", builtin.git_commits, "Telescope Git Commits")
bind("n", '<Leader><Leader>"', "<cmd>Telescope neoclip<cr>", "Telescope Neoclip")
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
bind("n", "<Leader>tr", "<cmd>TodoTelescope<cr>", "Telescope Todos")

-- remap to open the Telescope refactoring menu in visual mode
bind(
    "v",
    "<leader>rr",
    "<Esc><cmd>lua require('telescope').extensions.refactoring.refactors()<CR>",
    "Telescope Refactoring"
)

-- zoxide
bind("n", "<Leader>z", ":lua require'telescope'.extensions.zoxide.list{}<CR>", "Telescope Zoxide")

vim.cmd([[cab tn Telescope notify]])
