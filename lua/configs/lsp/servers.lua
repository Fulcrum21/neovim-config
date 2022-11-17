local servers = {
    'sumneko_lua',
    'ccls'
}



local lspconfig_status, lspconfig = pcall(require,'lspconfig')
if not lspconfig_status then
    return
end

local opts = {}

for _, server in pairs(servers) do
    opts = {
        on_attach = require("configs.lsp.handlers").on_attach,
        capabilities = require("configs.lsp.handlers").capabilities,
    }

    local serverconf_ok, conf_opts = pcall(require, "configs.lsp.server-settings." .. server)

    if serverconf_ok then
        opts = vim.tbl_deep_extend("force", conf_opts, opts)
    end

    lspconfig[server].setup(opts)

end
