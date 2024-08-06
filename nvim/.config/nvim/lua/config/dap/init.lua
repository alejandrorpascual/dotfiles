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
    local ui = require("dapui")
    ui.setup()

    -- go
    require("dap-go").setup()

    -- javascript
    -- require("config.dap.node").setup()
    require("config.dap.javascript").setup()

    -- nvim-dap
    vim.fn.sign_define("DapBreakpoint", { text = "🟥", texthl = "", linehl = "", numhl = "" })
    vim.fn.sign_define("DapStopped", { text = "⭐️", texthl = "", linehl = "", numhl = "" })

    local wk = require("which-key")
    local dap = require('dap')

    wk.add({
        { "<leader>d",  group = "DAP" },
        { "<leader>dc", dap.continue,          desc = "Continue" },
        { "<leader>db", dap.toggle_breakpoint, desc = "Toggle breakpoint" },
        { "<leader>df", dap.step_over,         desc = "Step Over" },
        { "<leader>di", dap.step_into,         desc = "Step Into" },
        { "<leader>do", dap.step_out,          desc = "Step Out" },
        { "<leader>dj", dap.down,              desc = "Down" },
        { "<leader>dk", dap.up,                desc = "Up" },
        { "<leader>dx", dap.terminate,         desc = "Terminate" },
        { "<leader>dz", dap.disconnect,        desc = "Disconnect" },

        {
            "<leader>dB",
            function()
                dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
            end,
            desc = "Breakpoint with condition"
        },
        { "<leader>dn",  dap.run_to_cursor,                                   desc = "Run to cursor" },
        {
            "<leader>dm",
            function()
                dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
            end,
            desc = "Set breakpoint with message"
        },

        { "<leader>dt",  group = "DAP Telescope" },
        { "<leader>dtc", require "telescope".extensions.dap.commands,         desc = "Commands" },
        { "<leader>dtb", require "telescope".extensions.dap.list_breakpoints, desc = "List breakpoints" },
        { "<leader>dtv", require "telescope".extensions.dap.variables,        desc = "Variables" },
        { "<leader>dtf", require "telescope".extensions.dap.frames,           desc = "Frames" },

        -- restart
        { "<leader>ds",  require("dap").restart,                              desc = "Restart" },

        -- toggle dap ui
        { "<leader>du",  ui.toggle,                                           desc = "Toggle UI" },
        --    vim.keymap.set("n", "<space>?", function()
        -- require("dapui").eval(nil, { enter = true })
        -- end)
        {
            "<leader>d?",
            function()
                ui.eval(nil, { enter = true, width = 60, height = 25 })
            end,
            desc = "DAP show value"
        }

    })

    dap.listeners.before.attach.dapui_config = function()
        ui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
        ui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
        ui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
        ui.close()
    end
end

return M
