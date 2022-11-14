-- list of lsp servers that can be installed using Mason.nvim
local servers = {
    'sumneko_lua'
}



-- setup mason and mason-lspconfig, and ensure that the above table of lsp servers are installed
require("mason").setup()
require("mason-lspconfig").setup(
    {
        ensure_installed = servers,
        automatic_installation = true,
    })

local lspconfig_status, lspconfig = pcall(require,'lspconfig')
if not lspconfig_status then
    return
end

-- insert the ccls lsp server in the table above, since it cannot be installed through mason.nvim (i installed this with my package manager)
table.insert(servers, "ccls")

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
