local M = {}

function M.setup()
    -- DAPInstall
    -- local dap_install = require("dap-install")
    -- dap_install.setup({
    --   installation_path = vim.fn.stdpath("data") .. "/dapinstall/",
    -- })

    -- telescope-dap
    require("telescope").load_extension("dap")

    -- nvim-dap-virtual-text. Show virtual text for current frame
    -- vim.g.dap_virtual_text = true -- deprecated
    -- require("nvim-dap-virtual-text").setup()

    -- nvim-dap-ui
    require("dapui").setup({})

    -- languages
    -- require("config.dap.node").setup()
    require("config.dap.javascript").setup()

    -- nvim-dap
    vim.fn.sign_define("DapBreakpoint", { text = "🟥", texthl = "", linehl = "", numhl = "" })
    vim.fn.sign_define("DapStopped", { text = "⭐️", texthl = "", linehl = "", numhl = "" })

    bind("n", "<leader>dsv", '<cmd>lua require"dap".step_over()<CR>', "DAP: Step over")
    bind("n", "<leader>dco", '<cmd>lua require"dap".continue()<CR>', "DAP: Continue")
    bind("n", "<leader>dsi", '<cmd>lua require"dap".step_into()<CR>', "DAP: Step into")
    bind("n", "<leader>dso", '<cmd>lua require"dap".step_out()<CR>', "DAP: Step out")
    bind("n", "<leader>dtb", '<cmd>lua require"dap".toggle_breakpoint()<CR>', "DAP: Toggle breakpoint")
    bind(
        "n",
        "<leader>dsbr",
        '<cmd>lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>',
        "DAP: Set breakpoint"
    )
    bind(
        "n",
        "<leader>dsbm",
        '<cmd>lua require"dap".set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<CR>',
        "DAP: Set log point"
    )
    bind("n", "<leader>dro", '<cmd>lua require"dap".repl.open()<CR>', "DAP: Open REPL")
    bind("n", "<leader>drl", '<cmd>lua require"dap".repl.run_last()<CR>', "DAP: Run last REPL command")

    -- telescope-dap
    bind("n", "<leader>dcc", '<cmd>lua require"telescope".extensions.dap.commands{}<CR>', "Telescope: DAP commands")
    bind(
        "n",
        "<leader>dcf",
        '<cmd>lua require"telescope".extensions.dap.configurations{}<CR>',
        "Telescope: DAP configurations"
    )
    bind(
        "n",
        "<leader>dlb",
        '<cmd>lua require"telescope".extensions.dap.list_breakpoints{}<CR>',
        "Telescope: DAP list breakpoints"
    )
    bind("n", "<leader>dv", '<cmd>lua require"telescope".extensions.dap.variables{}<CR>', "Telescope: DAP variables")
    bind("n", "<leader>df", '<cmd>lua require"telescope".extensions.dap.frames{}<CR>', "Telescope: DAP frames")

    bind("n", "<leader>dsr", '<cmd>lua require"dap".restart()<CR>', "DAP: Restart")
    -- toggle dap ui
    bind("n", "<leader>dtu", '<cmd>lua require"dapui".toggle()<CR>', "DAP: Toggle UI")
end

return M
