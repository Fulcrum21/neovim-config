require('plugins')


-- Aliases
local opt = vim.opt
local g = vim.g
local cmd = vim.cmd
local keymap = vim.keymap
local autocmd = vim.api.nvim_create_autocmd
local lspconf = require'lspconfig'

-- Options
opt.number = true
opt.syntax= ''
opt.relativenumber = true
opt.clipboard = "unnamedplus"
opt.updatetime = 300

opt.timeoutlen = 300 -- the amount of time to wait for a 
                     -- mapping sequence
opt.preserveindent = true -- preserve the indentation 
                          -- as much as possible
opt.mouse = "a"
opt.lazyredraw = true -- lazily redraw the screen
opt.copyindent = true -- copy the indentation from the
                      -- previous line
opt.shiftwidth = 4 -- sets tab to 4 spaces
opt.tabstop = 4 -- sets tabstops every 4 characters
opt.softtabstop = 4 -- same as shiftwidth
opt.expandtab = true -- replaces tabs with spaces
opt.formatoptions = "jql" -- idk what this does lmaoo
opt.signcolumn = "yes" -- always show the sign column

-- files are backuped in /tmp
opt.backupdir = "/tmp"
opt.backup = true

opt.cursorline = true -- highlights the line we are on

-- case insensitive, unless we search for a capital letter
opt.ignorecase = true
opt.smartcase = true


-- Keymaps
g.mapleader = ' '
keymap.set('i', 'jj', '<ESC>')
keymap.set('i', 'jk', '<ESC>')
keymap.set('i', 'jh', '<ESC>')
keymap.set('n', '<leader>q', ':q!<CR>')
keymap.set('n', '<leader>h', ':nohl<CR>')
keymap.set('n', '<leader>w', ':w<CR>')
keymap.set('n', '<leader>ft', ':!st -d %:h > /dev/null & disown<CR>')


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

-- Treesitter
require'nvim-treesitter.configs'.setup {
        ensure_installed = { "c", "lua" },

        highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
        },
}
require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = { "sumneko_lua"}
})


--lsp
lspconf.ccls.setup{ -- ccls
    init_options = {
        cache = { directory = "/tmp/ccls-cache"};
        clang = {
            extraArgs = {"--gcc-toolchain=/usr"}
        };
    }

}
lspconf.sumneko_lua.setup { -- sumneko_lua

    settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}


