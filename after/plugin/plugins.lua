local packer = require('packer')

return packer.startup({function(use)

    -- Packer itself
    use 'wbthomason/packer.nvim'

    -- Colorscheme
    use 'folke/tokyonight.nvim'

    -- Treesitter
    use 'nvim-treesitter/nvim-treesitter'
    -- AutoPairs
    use 'windwp/nvim-autopairs'

    -- LSP
    use 'neovim/nvim-lspconfig'
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'
end,

config = {
  display = {
      open_fn = function()
          return require('packer.util').float({border = 'single'})
      end
  }
}})
