bind("n", "<Space>", "<NOP>", "Disable Space")
bind("x", "<leader>p", '"_dP', "Dont override register when pasting")

vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- TERMINAL SHORTCUTS
bind("t", "<C-H>", "<C-\\><C-N><C-W>h", "[TERM MODE] Move to left split")
bind("t", "<C-J>", "<C-\\><C-N><C-W>j", "[TERM MODE] Move to bottom split")
bind("t", "<C-K>", "<C-\\><C-N><C-W>k", "[TERM MODE] Move to top split")
bind("t", "<C-L>", "<C-\\><C-N><C-W>l", "[TERM MODE] Move to right split")
-- bind("n", "<C-T>", ":vsplit term://zsh<CR>", "Open Terminal in VSplit")
bind("n", "<leader>tn", ":vsplit term://node<CR>", "Open Node Repl in VSplit")
bind("n", "<leader>tt", ":vsplit term://nr test:integration<CR>", "Open `test:integration` in VSplit")
bind("n", "<leader>tc", ":vsplit term://cargo run<CR>", "Open `cargo run` in VSplit")

bind("n", "<Leader>h", ":set hlsearch!<CR>", "Toggle Highlight")

-- better indenting
bind("v", "<", "<gv")
bind("v", ">", ">gv")

--  TAB/S-TAB to switch buffer
bind("n", "<TAB>", ":bnext<CR>")
bind("n", "<S-TAB>", ":bprevious<CR>")

-- Move selected line / block of text in visual mode
bind("x", "K", ":move '<-2<CR>gv=gv")
bind("x", "J", ":move '>+1<CR>gv=gv")
bind("i", "<A-j>", "<Esc>:m .+1<CR>==gi")
bind("i", "<A-k>", "<Esc>:m .-2<CR>==gi")
bind("n", "<A-j>", ":m .+1<CR>==")
bind("n", "<A-k>", ":m .-2<CR>==")

-- toggle lualine
bind("n", "<C-W>o", "<cmd>lua vim.o.ls=0<CR>")
bind("n", "<C-W>O", "<cmd>lua vim.o.ls=2<CR>")

-- BUFFERS
bind("n", "<Leader>ba", "<cmd>:%bd|e#|bd#<CR>")

-- rapid actions
bind("n", ",co", [[yiwoconsole.log(<C-R>")<esc>]], "Next line console.log")
bind("n", ",cn", [[yiwoconsole.log({<C-R>"})<esc>]], "Next line console.log({})")
bind("n", ",cd", [[yiwoconsole.dir(<C-R>", {depth: Number.MAX_SAFE_INTEGER})<esc>]], "Next line console.dir")
bind("v", ",cl", [[cconsole.log(<C-R>")<esc>]], "Inline console.log")
bind("v", ",js", [[cJSON.stringify(<C-R>", null, 2)<esc>]], "Inline visual JSON.stringify")
bind("v", ",xl", [[c<pre>{JSON.stringify(<C-R>", null, 2)}</pre><esc>]], "Inline visual <pre>JSON.stringify</pre>")

bind("v", ",5", [[c{% <C-R>" %}<esc>]])

bind("n", "<leader>ed", ":e %:h/<CR>", "Open Dir Tree in directory of current file")
bind("n", "<leader>vd", ":vs %:h/<CR>", "Open Dir Tree in directory of current file in VSplit")

-- open quickfix / close
bind("n", "<leader>co", ":cope<cr>")
bind("n", "<leader>cl", ":cclose<cr>")
bind("n", "<leader>j", ":cnext<cr>")
bind("n", "<leader>k", ":cprevious<cr>")

-- open location list - close manually
bind("n", "<leader>lo", ":lope<cr>")

-- copy to clipboard
bind("v", "<leader>y", [["*y]])

-- Resize with arrows
bind("n", "<M-Up>", ":resize +2<CR>")
bind("n", "<M-Down>", ":resize -2<CR>")
bind("n", "+", ":vertical resize +2<CR>")
bind("n", "-", ":vertical resize -2<CR>")

-- Primeagen suggests
bind("n", "n", "nzzzv")
bind("n", "N", "Nzzzv")
-- bind("n", "J", [[mzJ'`z]])

-- its like iw text object but for lines
bind("n", "vil", "v_og_")
bind("n", "<Leader>vil", "vg_o_")

-- toggle colorscheme
-- bind("n", "<C-C>", "<cmd>lua toggle_colorscheme()<cr>")

-- toggle colorscheme
bind("n", "<Leader>E", "<cmd>lua execute_code()<cr>")

vim.cmd([[
" Primeagen suggestion
inoremap , ,<c-g>u
inoremap - -<c-g>u
inoremap : :<c-g>u
inoremap ; ;<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u
inoremap ) )<c-g>u
inoremap ] ]<c-g>u
inoremap } }<c-g>u
inoremap ( (<c-g>u
inoremap [ [<c-g>u
inoremap { {<c-g>u)


augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 40})
augroup END
]])

vim.cmd([[
augroup enter_term_mode
    autocmd!
    autocmd TermOpen * startinsert
augroup END

augroup no_number_term
    autocmd!
    autocmd TermOpen * setlocal nonumber norelativenumber
augroup END
]])

vim.cmd([[
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
]])
