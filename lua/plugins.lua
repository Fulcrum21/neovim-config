local packer = require'packer'

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])



packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float {border = "rounded"}
        end,
    },
}

return packer.startup(function(use)

    -- Packer itself
    use 'wbthomason/packer.nvim'
    -- Some lua functions for plugins
    use 'nvim-lua/plenary.nvim'
    -- a popup api
    use 'nvim-lua/popup.nvim'
    -- optimizer
    use 'lewis6991/impatient.nvim'

    -- Colorschemes
    use { 'catppuccin/nvim', as = "catppuccin"}

    -- Treesitter
    use 'nvim-treesitter/nvim-treesitter'
    use 'p00f/nvim-ts-rainbow' -- Colored parantheses in treesitter
    -- AutoPairs
    use 'windwp/nvim-autopairs'

    -- LSP
    use 'neovim/nvim-lspconfig'

    -- Completion
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-nvim-lsp'
    -- snippets enginge
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'
    -- snippets collection
    use "rafamadriz/friendly-snippets"

    use { 'nvim-telescope/telescope.nvim', tag = '0.1.0'}

    -- Devicons
    use 'nvim-tree/nvim-web-devicons'

    -- Comments
    use 'numToStr/Comment.nvim'

    -- Git integration
    use 'lewis6991/gitsigns.nvim'

    -- Filesystem Tree
    use 'MunifTanjim/nui.nvim'
    use {
        'nvim-neo-tree/neo-tree.nvim',
        branch = "v2.x",
        }
end
)
