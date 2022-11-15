local keymap = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}


-- Leader key
-- General
keymap('i', 'jk', '<ESC>', opts)
keymap('i', 'jj', '<ESC>', opts)
keymap('n', '<leader>q', ':q!<CR>', opts)
keymap('n', '<leader>h', ':nohl<CR>', opts)
keymap('n', '<leader>w', ':w<CR>', opts)
keymap('n', '<leader>c', ':close<CR>', opts)
keymap('n', '<leader>ft', ':!st -d %:h 2> /dev/null & disown<CR><CR>', opts) -- open terminal in another window
keymap('v', '<Space><Space>', '<Esc>', opts) -- exit visual mode with two spaces

-- Indentation
keymap('v', '<', '<gv', opts)
keymap('v', '>', '>gv', opts)

-- Buffer movement
keymap('n', '<C-h>', '<C-w>h', opts)
keymap('n', '<C-j>', '<C-w>j', opts)
keymap('n', '<C-k>', '<C-w>k', opts)
keymap('n', '<C-l>', '<C-w>l', opts)
-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)
