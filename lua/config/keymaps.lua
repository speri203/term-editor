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
map({ "n" }, "H", "^", { desc = "Moves to the beginning of the line" })
map({ "n" }, "L", "$", { desc = "Move to the end of the line" })

-- Copying content from the location of cursor to end of line. Alternative to yy which copies the whole line
map({ "n" }, "Y", "y$", { desc = "Copy content from cursor position to end of the line" })

-- Remapping semi colon to colon to enter command mode easier
map({ "n" }, ";", ":", { desc = "Easier entry into command mode" })

-- Remapping the Lazy plugin window to leader lv
-- Not needed because I remapped the beginning and end of line to H and L
-- map({ "n" }, "<leader>lv", "<cmd>Lazy<Cr>", { desc = "Opens lazyvim plugin menu" })

-- Coverting word under cursor to upper and lower case
map({ "n" }, "<leader>wu", "<esc>mzgUiw`za<esc>", { desc = "Makes the current word under cursor into uppercase" })
map({ "n" }, "<leader>wl", "<esc>mzguiw`za<esc>", { desc = "Makes the current word under cursor into lowercase" })

-- Quickly saving and exiting a file
map({ "n" }, "<leader>sf", "<cmd>:w<cr>", { desc = "Saving a file" })
map({ "n" }, "<leader>sq", "<cmd>:q<cr>", { desc = "Exiting a file" })

-- Javascript specific remapping that I am not sure I will utilize but would be nice to have
map({ "i" }, "<C-l>", "<space>=><space>", { desc = "Javascript specific remapping for =>" })
