-- *****************************************************************
--                             OPTIONS
-- *****************************************************************
vim.cmd([[
set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
  \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
  \,sm:block-blinkwait175-blinkoff150-blinkon175
]])

vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true
vim.o.foldcolumn = "0"

vim.opt.termguicolors = true

vim.cmd([[set shortmess+=c]])
vim.opt.tgc = true
vim.opt.signcolumn = "yes:1"
vim.opt.hidden = true
vim.opt.swapfile = false

vim.scrolloff = 8

-- backups
vim.opt.undofile = true
vim.opt.backup = true
vim.opt.backupdir = vim.fn.expand("$HOME/.backup/nvim")
vim.opt.backupdir:remove(".")
vim.opt.mouse = "a"
vim.opt.winbar = "%f"
vim.o.breakindent = true

vim.opt.wildmode = "longest:full,full"

-- Numbers
vim.opt.number = true
vim.opt.numberwidth = 2
vim.opt.relativenumber = true

-- Indenline
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true

-- smartcase
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- splits
vim.opt.splitbelow = true
vim.opt.splitright = true

vim.g.user_emmet_leader_key = ","
vim.g.fieleencoding = "utf-8"

-- colorscheme
-- vim.opt.background = "dark" -- or "light" for light mode
-- vim.cmd([[colorscheme gruvbox]])

-- vim.cmd([[colorscheme nightfox]])
-- vim.color.set_scheme("nightfox")
-- nightfox.load()
--     CmpItemAbbr = { fg = palette.subtle },
--     CmpItemAbbrDeprecated = { fg = palette.highlight_inactive, style = 'strikethrough' },
--     CmpItemAbbrMatch = { fg = palette.iris, style = 'bold' },
--     CmpItemAbbrMatchFuzzy = { fg = palette.foam, style = 'bold' },
--     CmpItemKind = { fg = palette.rose },
--     CmpGhostText = { fg = palette.inactive, style = 'italic' },
-- vim.cmd([[colorscheme nightfox]])
-- vim.cmd([[colorscheme tokyonight]])
-- vim.g.tokyonight_style = "night"

-- markdown
vim.opt.conceallevel = 2

-- ========================= NeoTerm settings end ================
-- ===============================================================

-- ========================= Emojis settings =====================
--
-- vim.cmd([[
-- for e in emoji#list()
--   call append(line('$'), printf('%s (%s)', emoji#for(e), e))
-- ]])
-- endfor
