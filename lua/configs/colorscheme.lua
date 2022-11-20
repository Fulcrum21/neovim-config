local colorscheme = "catppuccin-macchiato"

if string.find(colorscheme, "catppuccin") then
    local status, colorconf = pcall(require, "catppuccin")
    if not status then
        return
    end

    colorconf.setup({
        integrations = {
            cmp = true,
            mason = true,
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

vim.cmd("colorscheme " .. colorscheme)
