local packer = require('packer')

return packer.startup({function(use)

    -- Packer itself
    use 'wbthomason/packer.nvim'
    -- Optimizer
    use 'lewis6991/impatient.nvim'

    -- Colorscheme
    use 'folke/tokyonight.nvim'

    -- Treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        config = [[require "configs.nvim-treesitter"]]
        }
    -- AutoPairs
    use {
        'windwp/nvim-autopairs',
        config = [[require "configs.autopairs"]]
        }

    -- LSP
    use {
        'neovim/nvim-lspconfig',
        config = [[require "configs.nvim-lsp"]]     
        }

    use {
        'williamboman/mason.nvim',
        config = [[require "configs.mason"]]
        }

    use {
        'williamboman/mason-lspconfig.nvim',
        after = {'nvim-lspconfig', 'mason.nvim'},
        config = [[require "configs.mason-lsp"]]
        }
end,

config = {
  display = {
      open_fn = function()
          return require('packer.util').float({border = 'single'})
      end
  }
}})
