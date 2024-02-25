return {
  -- DOCUMENT/CODE SYNTAX TREE
  -- h: close, l: open, W: close all, E: open all
  "hedyhli/outline.nvim",
  lazy = true,
  cmd = { "Outline", "OutlineOpen" },
  keys = {
    { "ga", "<cmd>Outline<CR>", desc = "List document symbols in a tree" },
    {
      "<leader>o",
      "<cmd>OutlineFollow<CR>",
      desc = "Focus cursor inside symbols outline window on current node"
    }
  },
  config = function()
    require("outline").setup({
      outline_window = { position = "left", width = 25 },
      symbols = {
        icons = {
          File = { icon = '󰈔', hl = 'Identifier' },
          Module = { icon = '󰆧', hl = 'Include' },
          Namespace = { icon = '󰌗', hl = 'Include' }, -- 󰅪
          Package = { icon = '', hl = 'Include' }, -- 󰏗
          Class = { icon = '𝓒', hl = 'Type' },
          Method = { icon = '', hl = 'Function' }, -- ƒ ➡️
          Property = { icon = '', hl = 'Identifier' },
          Field = { icon = '', hl = 'Identifier' }, -- 󰆨
          Constructor = { icon = '', hl = 'Special' }, -- 
          Enum = { icon = 'ℰ', hl = 'Type' },
          Interface = { icon = '', hl = 'Type' }, -- 󰜰
          Function = { icon = 'ƒ', hl = 'Function' }, -- 
          Variable = { icon = '', hl = 'Constant' },
          Constant = { icon = '', hl = 'Constant' },
          String = { icon = '𝓢', hl = 'String' }, -- 𝓐
          Number = { icon = '#', hl = 'Number' },
          Boolean = { icon = '◩', hl = 'Boolean' }, -- ⊨ 
          Array = { icon = '󰅪', hl = 'Constant' },
          Object = { icon = '', hl = 'Type' }, -- ⦿
          Key = { icon = '󰌋', hl = 'Type' }, -- 🔐
          Null = { icon = 'NULL', hl = 'Type' },
          EnumMember = { icon = '', hl = 'Identifier' },
          Struct = { icon = '', hl = 'Structure' }, -- 𝓢
          Event = { icon = '🗲', hl = 'Type' },
          Operator = { icon = '󰆕', hl = 'Identifier' }, -- + 
          TypeParameter = { icon = '󰊄', hl = 'Identifier' }, -- 𝙏
          Component = { icon = '󰅴', hl = 'Function' },
          Fragment = { icon = '󰅴', hl = 'Constant' },
          TypeAlias = { icon = ' ', hl = 'Type' }, -- 
          Parameter = { icon = ' ', hl = 'Identifier' },
          StaticMethod = { icon = ' ', hl = 'Function' },
          Macro = { icon = ' ', hl = 'Function' },
        },
      }
    })
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "Outline",
      command = "setlocal nofoldenable"
    })
  end
}
