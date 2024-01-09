return {
  'fedepujol/move.nvim',
  config = function()
    local opts = { noremap = true, silent = true }
    -- Normal-mode commands
    vim.keymap.set('n', '∆', ':MoveLine(1)<CR>', opts)
    vim.keymap.set('n', '˚', ':MoveLine(-1)<CR>', opts)
    vim.keymap.set('n', '˙', ':MoveHChar(-1)<CR>', opts)
    vim.keymap.set('n', '¬', ':MoveHChar(1)<CR>', opts)
    vim.keymap.set('n', '<leader>wf', ':MoveWord(1)<CR>', opts)
    vim.keymap.set('n', '<leader>wb', ':MoveWord(-1)<CR>', opts)

    -- Visual-mode commands
    vim.keymap.set('v', '∆', ':MoveBlock(1)<CR>', opts)
    vim.keymap.set('v', '˚', ':MoveBlock(-1)<CR>', opts)
    vim.keymap.set('v', '˙', ':MoveHBlock(-1)<CR>', opts)
    vim.keymap.set('v', '¬', ':MoveHBlock(1)<CR>', opts)
  end
}
