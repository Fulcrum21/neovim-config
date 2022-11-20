return {
    settings = {
        Lua = {
          runtime = {
            version = 'LuaJIT',
          },
          diagnostics = {
            globals = { 'vim',},
          },
          workspace = {
              library = {
                  vim.fn.expand "$VIMRUNTIME/lua",
                  vim.fn.expand "$HOME/.config/nvim/lua",
              },
          },
          telemetry = {
            enable = false,
          },
        },
      },
}

