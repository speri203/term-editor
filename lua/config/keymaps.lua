-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set
local del = vim.keymap.del

-- Displaying WhichKey in visual mode hightlight
map({ "v" }, "<leader>", "<cmd>:WhichKey <leader> v<cr>", { desc = "Whichkey menu in visual mode" })

-- Remapping Ctrl + w to Alt + backspace
map({ "i" }, "<A-bs>", "<C-w>", { desc = "Remapping Ctrl+W to Alt+backspace" })

-- Properly indent new lines in insert mode
map("n", "i", function()
  if #vim.fn.getline(".") == 0 then
    return [["_cc]]
  else
    return "i"
  end
end, { expr = true, desc = "properly indent on empty line when insert" })
