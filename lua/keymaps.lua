local setmap = vim.keymap.set
local opts = {noremap = true, silent = true}

local maps = { i = {}, n = {}, v = {}, }


-- Leader key
-- General
maps.i['jk'] = { '<ESC>', desc = "Exit Insert Mode"}
maps.i['jj'] = { '<ESC>', desc = "Exit Insert Mode"}
maps.n['<leader>q'] = { ':q!<CR>', desc = "Force Quit"}
maps.n['<leader>w'] = { ':w!<CR>', desc = "Save File"}
maps.n['<leader>h'] = { ':nohl<CR>', desc = "Removes search highlighting"}
maps.n['<leader>c'] = { ':close<CR>', desc = "Closes buffer"}
maps.n['<leader>ft'] = { ':!alacritty msg create-window --working-directory $(pwd) & disown<CR><CR>', desc = "Opens new terminal"}
maps.n['<leader>fc'] = { ':cd %:h<CR>', desc = "Changes cwd to the file's cwd"}
maps.v['<Space><Space>'] = { '<Esc>', desc = "Exits visual mode"}

-- Indentation
maps.v['<'] = {'<gv', desc = "indent selected line"}
maps.v['>'] = {'>gv', desc = "indent selected line"}

-- Buffer movement
maps.n['<C-j>'] = { '<C-w>j', desc = "easier split navigation"}
maps.n['<C-h>'] = { '<C-w>h', desc = "easier split navigation"}
maps.n['<C-k>'] = { '<C-w>k', desc = "easier split navigation"}
maps.n['<C-l>'] = { '<C-w>l', desc = "easier split navigation"}
-- Move text up and down
maps.v["<A-j>"] = { ":m '>+1<CR>gv-gv", desc = "Move Selected Text Down" }
maps.v["J"] = { ":m '>+1<CR>gv-gv", desc = "Move Selected Text Down" }
maps.v["<A-k>"] = { ":m '<-2<CR>gv-gv", desc = "Move Selected Text Down" }
maps.v["K"] = { ":m '<-2<CR>gv-gv", desc = "Move Selected Text Down" }
maps.v["p"] = { '"_dP', desc = "Pastes text without saving to clipboard"}

-- Telescope
maps.n["<leader>ff"] = { ":Telescope find_files<CR>", desc = "Find Files" }
maps.n["<leader>fw"] = {":Telescope live_grep<CR>", desc = "Find Word" }

-- Commenting
maps.n["<leader>/"] = {":lua require('Comment.api').toggle.linewise.current()<CR>", desc = "Comment line" }
maps.v["<leader>/"] = {"<Esc>:lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", desc = "Comment selected lines" }

-- Gitsigns
maps.n["<leader>gj"] = { function() require("gitsigns").next_hunk() end, desc = "Next git hunk" }
maps.n["<leader>gk"] = { function() require("gitsigns").prev_hunk() end, desc = "Previous git hunk" }
maps.n["<leader>gl"] = { function() require("gitsigns").blame_line() end, desc = "View git blame" }
maps.n["<leader>gp"] = { function() require("gitsigns").preview_hunk() end, desc = "Preview git hunk" }
maps.n["<leader>gh"] = { function() require("gitsigns").reset_hunk() end, desc = "Reset git hunk" }
maps.n["<leader>gr"] = { function() require("gitsigns").reset_buffer() end, desc = "Reset git buffer" }
maps.n["<leader>gs"] = { function() require("gitsigns").stage_hunk() end, desc = "Stage git hunk" }
maps.n["<leader>gu"] = { function() require("gitsigns").undo_stage_hunk() end, desc = "Unstage git hunk" }
maps.n["<leader>gd"] = { function() require("gitsigns").diffthis() end, desc = "View git diff" }

-- Neotree
maps.n["<leader>e"] = { "<cmd>Neotree toggle<cr>", desc = "Toggle Explorer" }
maps.n["<leader>o"] = { "<cmd>Neotree focus<cr>", desc = "Focus Explorer" }


for mode, mappings in pairs(maps) do
    for keymap, options in pairs(mappings) do
        local cmd = options[1]
        local keymap_opts = opts
        keymap_opts = vim.tbl_deep_extend("force", options, keymap_opts)
        keymap_opts[1] = nil
        setmap(mode, keymap, cmd, keymap_opts)
    end
end
