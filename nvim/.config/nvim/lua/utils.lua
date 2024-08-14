function _G.dump(...)
    local objects = vim.tbl_map(vim.inspect, { ... })
    print(unpack(objects))
    return ...
end

function _G.bind(mode, trigger, target, desc)
    local opts = {
        noremap = true,
        silent = true,
        desc = desc or "default description",
    }

    vim.keymap.set(mode, trigger, target, opts)
end

-- toggle colorscheme
function _G.toggle_colorscheme()
    vim.o.background = vim.o.background == "dark" and "light" or "dark"
end

function _G.execute_code()
    local ft = vim.bo.filetype

    if ft == "python" then
        vim.cmd([[!python3 %]])
    elseif ft == "lua" then
        vim.cmd([[!lua %]])
    elseif ft == "javascript" then
        vim.cmd([[!node %]])
    end
end

_G.global_callback = global_callback or {}

_G.global = {
    _store = global_callback,
    lualineTheme = "tokyonight",
}

function _G.check_formatters()
    local clients = vim.lsp.get_clients()
    for _, client in ipairs(clients) do
        print("Checking client " .. client.name)
        local has_formatting_cap = client.capabilities.formatting ~= nil
        if has_formatting_cap then
            print(">> Client " .. client.name .. " has formatting capability")
        end
    end
end

function _G.conflicting_clients()
    local clients = vim.lsp.get_clients()
    local conflicting_clients = {}
    for i, client1 in ipairs(clients) do
        for j = i + 1, #clients do
            local client2 = clients[j]
            if client1.name ~= client2.name and client1.capabilities.formatting ~= nil then
                table.insert(conflicting_clients, { client1, client2 })
            end
        end
    end

    for _, conflicting_pair in ipairs(conflicting_clients) do
        print("hello")
        print("Potential conflict between " .. conflicting_pair[1].name .. " and " .. conflicting_pair[2].name)
    end
end

local reload_module = function(module_name, starts_with_only)
    local matcher
    if not starts_with_only then
        matcher = function(pack)
            return string.find(pack, module_name, 1, true)
        end
    else
        matcher = function(pack)
            return string.find(pack, "^" .. module_name)
        end
    end

    -- Handle impatient.nvim automatically.
    ---@diagnostic disable-next-line: undefined-field
    local luacache = (_G.__luacache or {}).cache

    for pack, _ in pairs(package.loaded) do
        if matcher(pack) then
            package.loaded[pack] = nil

            if luacache then
                luacache[pack] = nil
            end
        end
    end
end

-- Reload Module Require
-- @param module name
_G.R = function(name)
    reload_module(name)
    return require(name)
end

function _G.P(...)
    local objects, v = {}, nil
    for i = 1, select("#", ...) do
        v = select(i, ...)
        table.insert(objects, vim.inspect(v))
    end

    print(table.concat(objects, "\n"))
    return ...
end

function global._create(f)
    table.insert(global._store, f)
    return #global._store
end

function global._execute(id, args)
    global._store[id](args)
end

function global.augroup(name, commands)
    vim.cmd("augroup " .. name)
    vim.cmd("autocmd!")
    for _, c in ipairs(commands) do
        if c.command and c.events then
            local command = c.command
            if type(command) == "function" then
                local fn_id = global._create(command)
                command = string.format("lua global._execute(%s)", fn_id)
            end
            c.events = type(c.events) == "string" and { c.events } or c.events
            vim.cmd(
                string.format(
                    "autocmd %s %s %s %s",
                    table.concat(c.events, ","),
                    table.concat(c.targets or {}, ","),
                    table.concat(c.modifiers or {}, " "),
                    command
                )
            )
        else
            vim.notify(
                string.format("An autocommand in %s is specified incorrectly: %s", name, vim.inspect(name)),
                vim.log.levels.ERROR
            )
        end
    end
    vim.cmd("augroup END")
end

function global.map(mode, keys, cmd, opt)
    local options = { noremap = true, silent = true }
    local buffer = nil
    if opt then
        buffer = opt.buffer
        opt.buffer = nil
        options = vim.tbl_extend("force", options, opt)
    end

    local valid_modes = {
        [""] = true,
        ["n"] = true,
        ["v"] = true,
        ["s"] = true,
        ["x"] = true,
        ["o"] = true,
        ["!"] = true,
        ["i"] = true,
        ["l"] = true,
        ["c"] = true,
        ["t"] = true,
    }

    local function map_wrapper(mo, lhs, rhs, opts)
        if type(lhs) == "table" then
            for _, key in ipairs(lhs) do
                map_wrapper(mo, key, rhs, opts)
            end
        else
            if type(mo) == "table" then
                for _, m in ipairs(mo) do
                    map_wrapper(m, lhs, rhs, opts)
                end
            else
                if type(rhs) == "function" then
                    local fn_id = global._create(rhs)
                    rhs = string.format("<cmd>lua global._execute(%s)<CR>", fn_id)
                end
                if valid_modes[mo] and lhs and rhs then
                    if buffer and type(buffer) == "number" then
                        return vim.api.nvim_buf_set_keymap(buffer, mo, lhs, rhs, opts)
                    end
                    return vim.api.nvim_set_keymap(mo, lhs, rhs, opts)
                else
                    mode, lhs, rhs = mode or "", lhs or "", rhs or ""
                    print(
                        "Cannot set mapping [ mode = '" .. mode .. "' | key = '" .. lhs .. "' | cmd = '" .. rhs .. "' ]"
                    )
                end
            end
        end
    end

    map_wrapper(mode, keys, cmd, options)
end

---Create an nvim command
---@param args table
function global.command(args)
    local nargs = args.nargs or 0
    local name = args[1]
    local rhs = args[2]
    local types = (args.types and type(args.types) == "table") and table.concat(args.types, " ") or ""

    if type(rhs) == "function" then
        local fn_id = global._create(rhs)
        rhs = string.format("lua global._execute(%d%s)", fn_id, nargs > 0 and ", <f-args>" or "")
    end

    vim.cmd(string.format("command! -nargs=%s %s %s %s", nargs, types, name, rhs))
end

M = {}

function M.on_open_terminal()
    if vim.fn.winwidth(".") > 100 then
        vim.g.neoterm_size = 65
        vim.g.neoterm_default_mod = "vertical"
    else
        vim.g.neoterm_size = 15
        vim.g.neoterm_default_mod = "belowright"
    end
end

M.is_transparent = 0
function M.Toggle_transparent()
    if M.is_transparent == 0 then
        vim.cmd([[hi Normal guibg=NONE ctermbg=NONE]])
        M.is_transparent = 1
    else
        vim.opt.background = "dark"
        M.is_transparent = 0
    end
end

--- check whether a feature exists in Nvim
--- @param feat string the feature name, like `nvim-0.7` or `unix`.
--- @return boolean
M.has = function(feat)
    if vim.fn.has(feat) == 1 then
        return true
    end

    return false
end

return M
