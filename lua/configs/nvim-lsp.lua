local lspconf = require'lspconfig'
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
        version = 'LuaJIT',
      },
      diagnostics = {
        globals = {'vim'},
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
      },
      telemetry = {
        enable = false,
      },
    },
  },
}
