local keymap = vim.keymap

keymap.set('i', 'jj', '<ESC>')
keymap.set('i', 'jk', '<ESC>')
keymap.set('i', 'jh', '<ESC>')
keymap.set('n', '<leader>q', ':q!<CR>')
keymap.set('n', '<leader>h', ':nohl<CR>')
keymap.set('n', '<leader>w', ':w<CR>')
keymap.set('n', '<leader>ft', ':!alacritty --working-directory %:h > /dev/null & disown<CR>')
