local lspconf = require'lspconfig'
local keymap = vim.keymap.set

local on_attach = function(client, bufnr)
   keymap('n', '<leader>ld', function() vim.diagnostic.open_float() end)
end



lspconf.ccls.setup{ -- ccls
    on_attach = on_attach,
    init_options = {
        cache = { directory = "/tmp/ccls-cache"};
        clang = {
            extraArgs = {"--gcc-toolchain=/usr"}
        };
    }

}
lspconf.sumneko_lua.setup { -- sumneko_lua

    on_attach = on_attach,
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
