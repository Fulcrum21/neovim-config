-- VARIABLES --
local options = {
    opt = {
        cmdheight = 0,
        number = true,
        relativenumber = true,
        clipboard = "unnamedplus",
        updatetime = 300,
        undofile = true,
        splitbelow = true,
        splitright = true,
        completeopt = {"menuone", "noselect"},
        laststatus = 3,
        pumheight = 10,
        scrolloff = 8,
        shortmess = vim.opt.shortmess + {s = true, I = true},
        sidescrolloff = 8,
        timeoutlen = 300,
        preserveindent = true,
        smartindent = true,
        mouse = "a",
        lazyredraw = true,
        copyindent = true,
        numberwidth = 2,
        shiftwidth = 4,
        tabstop = 4,
        softtabstop = 4,
        expandtab = true,
        formatoptions = "jql",
        signcolumn = "yes",
        termguicolors = true,
        backupdir = "/tmp",
        backup = true,
        writebackup = false,
        swapfile = false,
        cursorline = true,
        ignorecase = true,
        smartcase = true,
    },

}

for scope, opt_table in pairs(options) do
    for option, value in pairs(opt_table) do
	    vim[scope][option] = value
    end
end
