return {
    "github/copilot.vim",
    cond = not vim.g.vscode,
    config = function()
        vim.cmd([[
          let g:copilot_no_tab_map = v:true
          imap <silent><script><expr> <C-g> copilot#Accept("\<CR>")
          ]])
    end,
}
