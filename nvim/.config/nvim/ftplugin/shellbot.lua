vim.bo.textwidth = 0
vim.wo.list = false
vim.wo.number = false
vim.wo.relativenumber = false
vim.wo.showbreak = 'NONE'

dump("RUNNING ?")

local has_shellbot = require('chatgpt')
if has_shellbot then
    vim.keymap.set({ 'i', 'n' }, '<M-CR>', ChatGPTSubmit, { buffer = true })
end
