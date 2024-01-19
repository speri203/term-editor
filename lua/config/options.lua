-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.python3_host_prog = '/Users/peri/.config/nvim/vim/bin/python'

-- Adding character to indicate where end of line is
vim.opt.listchars:append("eol:↴")

-- VSCode neovim integration
if vim.env.VSCODE then
  vim.g.vscode = true
end
