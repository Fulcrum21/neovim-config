local opt = vim.opt

-- Options
opt.cmdheight = 0
opt.number = true
opt.syntax= ''
opt.relativenumber = true
opt.clipboard = "unnamedplus"
opt.updatetime = 300
opt.undofile = true
opt.splitbelow = true
opt.splitright = true
opt.completeopt = {"menu", "menuone", "noselect"}

opt.timeoutlen = 1000 -- the amount of time to wait for a 
                     -- mapping sequence
opt.preserveindent = true -- preserve the indentation 
opt.smartindent = true
                          -- as much as possible
opt.mouse = "a"
opt.lazyredraw = true -- lazily redraw the screen
opt.copyindent = true -- copy the indentation from the
                      -- previous line
opt.numberwidth = 2
opt.shiftwidth = 4 -- sets tab to 4 spaces
opt.tabstop = 4 -- sets tabstops every 4 characters
opt.softtabstop = 4 -- same as shiftwidth
opt.expandtab = true -- replaces tabs with spaces
opt.formatoptions = "jql" -- idk what this does lmaoo
opt.signcolumn = "yes" -- always show the sign column
opt.autochdir = true
opt.termguicolors = true
-- files are backuped in /tmp
opt.backupdir = "/tmp"
opt.backup = true

opt.cursorline = true -- highlights the line we are on

-- case insensitive, unless we search for a capital letter
opt.ignorecase = true
opt.smartcase = true
