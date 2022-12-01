-- Colorscheme plugins: Catppuccin/nvim , marko-cerovac/material.nvim

-- Catppuccin colors: Mocha*, Macchiato, Frappe, Latte
-- https://github.com/catppuccin/nvim

-- material colors: darker, lighter, oceanic, palenight*, deep ocean
-- https://github.com/marko-cerovac/material.nvim





local colorscheme = "catppuccin"

if colorscheme == "catppuccin" then
    require("catppuccin").setup({
        flavour = "mocha",

        integrations = {
            cmp = true,
            treesitter = true,
            ts_rainbow = true,
        },

        native_lsp = {
            enabled = true,

            virtual_text = {
            errors = { "italic" },
            hints = { "italic" },
            warnings = { "italic" },
            information = { "italic" },
            },


            underlines = {
                errors = { "underline"},
                hints = { "underline" },
                warnings = { "underline" },
                information = { "underline" },
            },
        },
    })

end

if colorscheme == 'material' then
    require('material').setup {

        contrast = {
            cursor_line = true,
        },

        plugins = {
            "gitsigns",
            "nvim-cmp",
            "telescope",
        }
    }

    vim.g.material_style = "palenight"
end

vim.cmd("colorscheme " .. colorscheme)
