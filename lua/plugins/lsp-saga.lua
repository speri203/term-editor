return {
  'nvimdev/lspsaga.nvim',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-tree/nvim-web-devicons',
  },
  lazy = true,
  event = 'LspAttach',
  opts = function()
    vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#8ec07c", bg = "#242424" })
    return {
      ui = {
        border = 'rounded',
      },
      symbol_in_winbar = {
        enable = true,
        folder_level = 2,
      },
      lightbulb = {
        enable = false,
        sign = false,
      },
      outline = {
        layout = 'float',
        max_height = 0.7,
        left_width = 0.4,
      },
    }
  end,
  keys = {
    {
      '<leader>gj',
      '<Cmd>Lspsaga diagnostic_jump_next<CR>',
      mode = 'n',
      noremap = true,
      silent = true,
      desc = 'Diagnostics: Jump next (lspsaga)',
    },
    {
      '<leader>gh',
      '<Cmd>Lspsaga hover_doc<CR>',
      mode = 'n',
      noremap = true,
      silent = true,
      desc = 'Documentation on hover (lspsaga)'
    },
    {
      '<leader>gl',
      '<Cmd>Lspsaga show_line_diagnostics<CR>',
      mode = 'n',
      noremap = true,
      silent = true,
      desc = "Diagnostics: Show line's (lspsaga)",
    },
    {
      '<leader>gb',
      '<Cmd>Lspsaga show_buf_diagnostics<CR>',
      mode = 'n',
      noremap = true,
      silent = true,
      desc = "Diagnostics: Show buffer's (lspsaga)",
    },
    {
      '<leader>gf',
      '<Cmd>Lspsaga finder<CR>',
      mode = 'n',
      noremap = true,
      silent = true,
      desc = 'Find references (lspsaga)',
    },
    {
      '<leader>gp',
      '<Cmd>Lspsaga peek_definition<CR>',
      mode = 'n',
      noremap = true,
      silent = true,
      desc = 'Peek definition (lspsaga)',
    },
    {
      '<leader>gt',
      '<Cmd>Lspsaga peek_type_definition<CR>',
      mode = 'n',
      noremap = true,
      silent = true,
      desc = 'Peek type definition (lspsaga)',
    },
    {
      '<leader>gr',
      '<Cmd>Lspsaga rename<CR>',
      mode = 'n',
      noremap = true,
      silent = true,
      desc = 'Rename (lspsaga)',
    },
    {
      '<leader>go',
      '<Cmd>Lspsaga outline<CR>',
      mode = 'n',
      noremap = true,
      silent = true,
      desc = "Show file outline (lspsaga) - 'e' to jump, 'o' to toggle",
    },
    {
      '<leader>ga',
      '<cmd>Lspsaga code_action<CR>',
      mode = { 'n', 'v' },
      desc = 'Show code action (lspsaga)',
    },
  },
}
