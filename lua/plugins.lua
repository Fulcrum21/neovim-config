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
    use 'nvim-lua/plenary.nvim'
    use 'nvim-lua/popup.nvim'

    use 'lewis6991/impatient.nvim'

    -- Colorschemes
    use 'folke/tokyonight.nvim'
    use { 'catppuccin/nvim', as = "catppuccin"}

    -- Treesitter
    use 'nvim-treesitter/nvim-treesitter'
    -- AutoPairs
    use 'windwp/nvim-autopairs'

    use 'williamboman/mason.nvim'

    use 'williamboman/mason-lspconfig.nvim'

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
end
)
