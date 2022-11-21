local impatient_status, impatient = pcall(require, 'impatient')
if not impatient_status then
    return
end
impatient.enable_profile()

vim.api.nvim_set_keymap("n", '<Space>', '<Nop>', {silent = true, noremap = true})
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

for _, source in ipairs {
    "plugins",
    "configs.cmp",
    "configs.lsp",
    "configs.nvim-treesitter",
    "configs.autopairs",
    "configs.colorscheme",
    "configs.telescope",
    "configs.comment",
    "configs.gitsigns",
    "options",
    "autocmd",
    "keymaps",
} do
  local status_ok, fault = pcall(require, source)
  if not status_ok then vim.api.nvim_err_writeln("Failed to load " .. source .. "\n\n" .. fault) end
end
