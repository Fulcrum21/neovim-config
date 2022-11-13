local impatient_status, impatient = pcall(require, 'impatient')
if not impatient_status then
    return
end
impatient.enable_profile()

for _, source in ipairs {
    "options",
    "keymaps",
    "plugins",
    "configs.cmp",
    "configs.mason",
    "configs.mason-lsp",
    "configs.lsp",
    --"configs.nvim-lsp",
    "configs.nvim-treesitter",
    "configs.autopairs",
    "autocmd",
} do
  local status_ok, fault = pcall(require, source)
  if not status_ok then vim.api.nvim_err_writeln("Failed to load " .. source .. "\n\n" .. fault) end
end

-- Colorscheme
local colorscheme = "tokyonight-storm"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
    vim.notify("colorscheme " .. colorscheme .. " not found")
    return
end

