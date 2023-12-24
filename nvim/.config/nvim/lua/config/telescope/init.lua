-- initial setup [defaults]
local tele = require("telescope")
local actions = require("telescope.actions")
local lga_actions = require("telescope-live-grep-args.actions")
local trouble = require("trouble.providers.telescope")

tele.setup({
    defaults = {
        file_sorter = require("telescope.sorters").get_fzy_sorter,
        prompt_prefix = "👉 ",
        color_devicons = true,
        file_ignore_patterns = { "node_modules" },
        file_previewer = require("telescope.previewers").vim_buffer_cat.new,
        grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
        qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,

        mappings = {
            i = {
                ["<C-q>"] = actions.send_to_qflist,
                ["<C-h>"] = "which_key",
                ["<C-k>"] = lga_actions.quote_prompt(),
                -- ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
                ["<C-Down>"] = actions.cycle_history_next,
                ["<C-UP>"] = actions.cycle_history_prev,
                ["<c-t>"] = trouble.open_with_trouble,
            },
            n = { ["<c-t>"] = trouble.open_with_trouble },
        },

        -- layout_config = {
        --     -- MINE
        --     -- horizontal = {
        --     --   preview_width = 68,
        --     -- },
        --     -- vertical = {
        --     --   mirror = false,
        --     -- },
        --     -- CodeSmell's
        --     prompt_position = "bottom",
        --     horizontal = {
        --         width_padding = 0.04,
        --         height_padding = 0.1,
        --         preview_width = 0.6,
        --     },
        --     vertical = {
        --         width_padding = 0.05,
        --         height_padding = 1,
        --         preview_height = 0.5,
        --     },
        -- },
    },
    pickers = {
        find_files = {
            hidden = true,
        },
        buffers = {
            previewer = false,
            layout_config = {
                width = 80,
            },
        },
        oldfiles = {
            prompt_title = "History",
        },
    },
    extensions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
        },
        file_browser = {
            hijack_netrw = true,
        },
    },
})

tele.load_extension("fzy_native")
tele.load_extension("live_grep_args")
tele.load_extension("project")
tele.load_extension("bookmarks")
tele.load_extension("lsp_handlers")
tele.load_extension("node_modules")
tele.load_extension("ultisnips")
tele.load_extension("zoxide")
tele.load_extension("neoclip")
tele.load_extension("emoji")

-- load refactoring Telescope extension
tele.load_extension("refactoring")
tele.load_extension("file_browser")
tele.load_extension("egrepify")
