local M = {}


local cmp_nvim_lsp = require("cmp_nvim_lsp")

M.capabilities = cmp_nvim_lsp.default_capabilities()
M.capabilities.textDocument.completion.completionItem.snippetSupport = true

M.setup = function()
    local signs = {

            { name = "DiagnosticSignError", text = "" },
		    { name = "DiagnosticSignWarn", text = "" },
		    { name = "DiagnosticSignHint", text = "" },
		    { name = "DiagnosticSignInfo", text = "" },

    }

    for _, sign in pairs(signs) do
        vim.fn.sign_define(sign.name, {texthl = sign.name, text = sign.text, numhl = ""})
    end

    local config = {
        virtual_text = false,
        signs = { active = signs,},
        update_in_insert = true,
        underline = true,
        severity_sort = true,
        float = {
                focusable = true,
			    style = "minimal",
			    border = "rounded",
			    source = "always",
			    header = "",
			    prefix = "",
        },
    }

    vim.diagnostic.config(config)

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
		border = "rounded",
	})

	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
		border = "rounded",
	})
end

local function lsp_keymaps(bufnr)

    local opts = { silent = true, noremap = true}
    local keymap = vim.api.nvim_buf_set_keymap
    keymap(bufnr, "n", "<leader>ld", "<cmd> lua vim.diagnostic.open_float()<CR>", opts)
    keymap(bufnr, "n", "gD", "<cmd> lua vim.lsp.buf.declaration()<CR>", opts)
    keymap(bufnr, "n", "gd", "<cmd> lua vim.lsp.buf.definition()<CR>", opts)
    keymap(bufnr, "n", "[d", "<cmd> lua vim.diagnostic.goto_prev()<CR>", opts)
    keymap(bufnr, "n", "]d", "<cmd> lua vim.diagnostic.goto_next()<CR>", opts)
    keymap(bufnr, "n", "gl", "<cmd> lua vim.diagnostic.open_float()<CR>", opts)
    keymap(bufnr, "n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
    keymap(bufnr, "n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)

end

M.on_attach = function(client, bufnr)
    if client.name == "sumneko_lua" then
        client.server_capabilities.documentFormattingProvider = false
    end

    lsp_keymaps(bufnr)

end

return M
