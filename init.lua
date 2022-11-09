-- Aliases
local g = vim.g
local cmd = vim.cmd

g.mapleader = ' '

local impatient_ok, impatient = pcall(require, "impatient")
if impatient_ok then impatient.enable_profile() end

for _, source in ipairs {
    "plugins",
    "options",
    "autocmd",
    "keymaps",
} do
  local status_ok, fault = pcall(require, source)
  if not status_ok then vim.api.nvim_err_writeln("Failed to load " .. source .. "\n\n" .. fault) end
end

-- Colorscheme
cmd[[ colorscheme tokyonight-moon]]
