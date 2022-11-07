-- Aliases
local g = vim.g
local cmd = vim.cmd
local autocmd = vim.api.nvim_create_autocmd


-- the leader key
g.mapleader = ' '

-- Autocommands
autocmd({ "VimEnter", "VimResume" }, {
    pattern = "*",
    desc= "sets the cursor to use in neovim",
    command = "set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"
})

autocmd({ "VimLeave", "VimSuspend" }, {
    pattern = "*",
    desc= "resets the cursor to its original shape in term",
    command = "set guicursor=a:hor20-blinkon250-blinkwait700-blinkoff400"
})

autocmd({"BufNewFile", "BufWinEnter"}, {
    pattern = "*",
    desc = "sets formatopts properly",
    command = "setlocal formatoptions-=cro"
})

-- Colorscheme
cmd[[ colorscheme tokyonight-moon]]
