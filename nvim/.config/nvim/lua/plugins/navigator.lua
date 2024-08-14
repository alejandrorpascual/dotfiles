return {
    'ray-x/navigator.lua',
    dependencies = {
        { 'ray-x/guihua.lua',     build = 'cd lua/fzy && make' },
        { 'neovim/nvim-lspconfig' },
    },
    config = function()
        require 'navigator'.setup({
            on_attach = require("config.lsp.attach"),
            default_mapping = false,
            lsp = {
                diagnostic = {
                    float = {
                        focusable = true,
                    }
                },
                disable_format_cap = { "sqlls", "gopls", "tsserver", "eslint_d" }, -- a list of lsp disable format capacity (e.g. if you using efm or vim-codeformat etc), empty {} by default
                disable_lsp = {
                    "angularls", "flow", "julials", "pylsp",
                    "jedi_language_server", "jdtls", "vimls", "html", "solargraph", "cssls",
                    "denols", "graphql", "dartls", "dotls",
                    "kotlin_language_server", "nimls", "intelephense", "vuels", "phpactor", "omnisharp",
                    "r_language_server", "terraformls"
                },
                yamlls = {
                    settings = {
                        yaml = {
                            schemaStore = {
                                enable = true,
                                url = "https://www.schemastore.org/api/json/catalog.json",
                            },
                            schemas = {
                                kubernetes = "k8s-*.yaml",
                                ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*",
                                ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
                                ["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/**/*.{yml,yaml}",
                                ["http://json.schemastore.org/prettierrc"] = ".prettierrc.{yml,yaml}",
                                ["http://json.schemastore.org/kustomization"] = "kustomization.{yml,yaml}",
                                ["http://json.schemastore.org/chart"] = "Chart.{yml,yaml}",
                                ["http://json.schemastore.org/circleciconfig"] = ".circleci/**/*.{yml,yaml}",
                            },
                        },
                    },
                    capabilities = {
                        textDocument = {
                            foldingRange = {
                                dynamicRegistration = false,
                                lineFoldingOnly = true
                            }
                        }
                    }
                }
            },
            keymaps = {
                { key = 'gr',            func = require('navigator.reference').async_ref,                desc = 'Navigator async_ref' },
                { key = '<Leader>gr',    func = require('navigator.reference').reference,                desc = 'Navigator reference' }, -- reference deprecated
                { mode = 'i',            key = '<M-k>',                                                  func = vim.lsp.buf.signature_help,                        desc = 'Navigator signature_help' },
                { key = '<c-s>',         func = vim.lsp.buf.signature_help,                              desc = 'Navigator signature_help' },
                { key = '<Leader>g0',    func = require('navigator.symbols').document_symbols,           desc = 'Navigator document_symbols' },
                { key = 'gW',            func = require('navigator.workspace').workspace_symbol_live,    desc = 'Navigator workspace_symbol_live' },
                { key = '<c-]>',         func = require('navigator.definition').definition,              desc = 'Navigator definition' },
                { key = 'gd',            func = require('navigator.definition').definition,              desc = 'Navigator definition' },
                { key = 'gD',            func = vim.lsp.buf.declaration,                                 desc = 'Navigator declaration', },            -- fallback used
                -- for lsp handler
                { key = 'gp',            func = require('navigator.definition').definition_previewgp,    desc = 'Navigator definition_preview' },      -- paste
                { key = 'gP',            func = require('navigator.definition').type_definition_preview, desc = 'Navigator type_definition_preview' }, -- paste
                { key = '<Leader>gt',    func = require('navigator.treesitter').buf_ts,                  desc = 'Navigator buf_ts' },
                { key = '<Leader>gT',    func = require('navigator.treesitter').bufs_ts,                 desc = 'Navigator bufs_ts' },
                { key = '<Leader>ct',    func = require('navigator.ctags').ctags,                        desc = 'Navigator ctags' },
                { key = '<Space>ca',     mode = 'n',                                                     func = require('navigator.codeAction').code_action,       desc = 'Navigator code_action' },
                { key = '<Space>ca',     mode = 'v',                                                     func = require('navigator.codeAction').range_code_action, desc = 'Navigator range_code_action' },
                -- { key = '<Leader>re', func = 'rename()' },
                { key = '<Space>rn',     func = require('navigator.rename').rename,                      desc = 'Navigator rename' },
                { key = '<Leader>gi',    func = vim.lsp.buf.incoming_calls,                              desc = 'Navigator incoming_calls' },
                { key = '<Leader>go',    func = vim.lsp.buf.outgoing_calls,                              desc = 'Navigator outgoing_calls' },
                { key = 'gi',            func = vim.lsp.buf.implementation,                              desc = 'Navigator implementation' }, -- insert
                { key = '<Space>D',      func = vim.lsp.buf.type_definition,                             desc = 'Navigator type_definition' },
                { key = 'gL',            func = require('navigator.diagnostics').show_diagnostics,       desc = 'Navigator show_diagnostics' },
                { key = 'gG',            func = require('navigator.diagnostics').show_buf_diagnostics,   desc = 'Navigator show_buf_diagnostics' },
                { key = '<Leader>td',    func = require('navigator.diagnostics').toggle_diagnostics,     desc = 'Navigator toggle_diagnostics' },
                { key = ']d',            func = require('navigator.diagnostics').goto_next,              desc = 'Navigator next diagnostics error or fallback' },
                { key = '[d',            func = require('navigator.diagnostics').goto_prev,              desc = 'Navigator prev diagnostics error or fallback' },
                { key = ']O',            func = vim.diagnostic.set_loclist,                              desc = 'Navigator diagnostics set loclist' },
                { key = ']r',            func = require('navigator.treesitter').goto_next_usage,         desc = 'Navigator goto_next_usage' },
                { key = '[r',            func = require('navigator.treesitter').goto_previous_usage,     desc = 'Navigator goto_previous_usage' },
                { key = '<C-LeftMouse>', func = vim.lsp.buf.definition,                                  desc = 'Navigator definition', },
                { key = 'g<LeftMouse>',  func = vim.lsp.buf.implementation,                              desc = 'Navigator implementation' },
                { key = '<Leader>k',     func = require('navigator.dochighlight').hi_symbol,             desc = 'Navigator hi_symbol' },
                { key = '<Space>wa',     func = require('navigator.workspace').add_workspace_folder,     desc = 'Navigator add_workspace_folder' },
                { key = '<Space>wr',     func = require('navigator.workspace').remove_workspace_folder,  desc = 'Navigator remove_workspace_folder' },
                -- { key = '<Space>ff',     func = vim.lsp.buf.format,                                             mode = {'n', 'v', 'x'},                                               desc =  'Navigator format' },
                { key = '<Space>gm',     func = require('navigator.formatting').range_format,            mode = 'n',                                               desc = 'Navigator range format operator e.g gmip' },
                { key = '<Space>wl',     func = require('navigator.workspace').list_workspace_folders,   desc = 'Navigator list_workspace_folders' },
            }
        })
        bind('n', '<leader>ee', vim.diagnostic.open_float, 'Show Line Diagnostics')
    end
}
