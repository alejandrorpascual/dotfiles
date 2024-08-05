return {
    "epwalsh/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    -- lazy = true,
    -- ft = "markdown",
    -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
    -- event = {
    --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
    --   -- refer to `:h file-pattern` for more examples
    --   "BufReadPre path/to/my-vault/*.md",
    --   "BufNewFile path/to/my-vault/*.md",
    -- },
    dependencies = {
        -- Required.
        "nvim-lua/plenary.nvim",

        -- see below for full list of optional dependencies 👇
    },
    config = function(_, opts)
        require("obsidian").setup(opts)


        local wk = require("which-key")
        wk.add({
            { "<leader>o",  group = "obsidian" },
            { "<leader>on", "<cmd>ObsidianNew<cr>",         desc = "New note" },
            { "<leader>oq", "<cmd>ObsidianQuickSwitch<cr>", desc = "Quick switch" },
            { "<leader>ot", "<cmd>ObsidianTags<cr>",        desc = "Tags" },
            { "<leader>ol", "<cmd>ObsidianLinks<cr>",       desc = "Links" },
            { "<leader>or", "<cmd>ObsidianRename<cr>",      desc = "Rename" },
            {
                mode = "v",
                "<leader>oe",
                function()
                    local title = vim.fn.input { prompt = "Enter title (optional): " }
                    vim.cmd("ObsidianExtractNote " .. title)
                end,
                desc = "Extract note"
            }
        })
    end,
    opts = {
        -- Optional, completion of wiki links, local markdown links, and tags using nvim-cmp.
        completion = {
            -- Set to false to disable completion.
            nvim_cmp = true,
            -- Trigger completion at 2 chars.
            min_chars = 2,
        },
        -- ui = { enable = false },
        mappings = {
            -- "Obisidan follow"
            ["<leader>of"] = {
                action = function()
                    return require("obsidian").util.gf_passthrough()
                end,
                opts = { noremap = false, expr = true, buffer = true },
            },
            -- "Obisidan toggle checkgox"
            ["<leader>od"] = {
                action = function()
                    return require("obsidian").util.toggle_checkbox()
                end,
                opts = { buffer = true },
            },
            -- "Obisidan create note"
            ["<leader>od"] = {
                action = function()
                    return require('obsidian').commands.new_note()
                end,
                opts = { buffer = true },
            },
        },
        workspaces = {
            {
                name = "personal",
                path = "~/obsidian/vaults/personal"
            },
        },

        -- see below for full list of options 👇
        notes_subdir = "0. Inbox",
        new_notes_location = "notes_subdir",
        -- Optional, alternatively you can customize the frontmatter data.
        ---@return table
        note_frontmatter_func = function(note)
            -- Add the title of the note as an alias.
            if note.title then
                note:add_alias(note.title)
            end

            local out = { id = note.id, aliases = note.aliases, tags = note.tags, area = "", project = "" }

            -- `note.metadata` contains any manually added fields in the frontmatter.
            -- So here we just make sure those fields are kept in the frontmatter.
            if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
                for k, v in pairs(note.metadata) do
                    out[k] = v
                end
            end

            return out
        end,
        -- Optional, for templates (see below).
        templates = {
            -- folder = "~/obsidian/vaults/personal/Templates",
            folder = "Templates",
            date_format = "%Y-%m-%d-%a",
            time_format = "%H:%M",
            tags = ""
        },
    },
}
