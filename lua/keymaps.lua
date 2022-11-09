local keymap = vim.keymap

-- General
keymap.set('i', 'jj', '<ESC>')
keymap.set('i', 'jk', '<ESC>')
keymap.set('i', 'jh', '<ESC>')
keymap.set('n', '<leader>q', ':q!<CR>')
keymap.set('n', '<leader>h', ':nohl<CR>')
keymap.set('n', '<leader>w', ':w<CR>')
keymap.set('n', '<leader>ft', ':!st -d %:h > /dev/null & disown<CR><CR>')


-- LSP
