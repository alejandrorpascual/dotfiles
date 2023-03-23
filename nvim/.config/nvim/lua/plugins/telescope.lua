return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-lua/popup.nvim",
        "nvim-telescope/telescope-live-grep-args.nvim",
        { "nvim-telescope/telescope-fzy-native.nvim", build = "make" },
        "nvim-telescope/telescope-file-browser.nvim",
        "nvim-telescope/telescope-symbols.nvim",
        "nvim-telescope/telescope-project.nvim",
        "nvim-telescope/telescope-z.nvim",
        "nvim-telescope/telescope-dap.nvim",
        "gbrlsnchs/telescope-lsp-handlers.nvim",
        "dhruvmanila/telescope-bookmarks.nvim",
        "nvim-telescope/telescope-node-modules.nvim",
        "sudormrfbin/cheatsheet.nvim",
        "fhill2/telescope-ultisnips.nvim",
        "jvgrootveld/telescope-zoxide",
        "xiyaowong/telescope-emoji.nvim",
    },
    config = function()
        require("config.telescope")
        require("config.telescope.mappings")
    end,
}
