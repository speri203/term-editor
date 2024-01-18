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

-- Moving to the beginning and end of line without using numbers or symbols
map({ "n" }, "<leader>lb", "^", { desc = "Moves to the beginning of the line" })
map({ "n" }, "<leader>le", "$", { desc = "Move to the end of the line" })

-- Remapping the Lazy plugin window to leader lv
map({ "n" }, "<leader>lv", "<cmd>Lazy<Cr>", { desc = "Opens lazyvim plugin menu" })

-- Coverting word under cursor to upper and lower case
map({ "n" }, "<leader>wu", "<esc>mzgUiw`za<esc>", { desc = "Makes the current word under cursor into uppercase" })
map({ "n" }, "<leader>wl", "<esc>mzguiw`za<esc>", { desc = "Makes the current word under cursor into lowercase" })

-- Quickly saving and exiting a file
map({ "n" }, "<leader>sf", "<cmd>:w<cr>", { desc = "Saving a file" })
map({ "n" }, "<leader>sq", "<cmd>:q<cr>", { desc = "Exiting a file" })
