return {
  "SmiteshP/nvim-navbuddy",
  dependencies = {
    "neovim/nvim-lspconfig", "SmiteshP/nvim-navic",
    "MunifTanjim/nui.nvim"
  },
  lazy = true,
  event = "BufEnter",
  enabled = false,
  keys = {
    {
      "<leader>nb",
      function() require("nvim-navbuddy").open() end,
      desc = "Navigate symbols via Navbuddy tree",
      mode = "n",
      noremap = true,
      silent = true
    }
  },
  config = function()
    local navbuddy = require("nvim-navbuddy")
    local actions = require("nvim-navbuddy.actions")
    navbuddy.setup({
      icons = {
        File          = "󰈙 ",
        Module        = "󰆧 ", -- 
        Namespace     = "󰌗 ",
        Package       = " ", -- 
        Class         = "𝓒 ", -- 󰌗
        Method        = " ", -- 󰆧
        Property      = " ", -- 
        Field         = " ", -- 
        Constructor   = " ",
        Enum          = "ℰ", -- 󰕘
        Interface     = "", -- 󰕘
        Function      = "󰊕 ",
        Variable      = " ", -- 󰆧
        Constant      = "󰏿 ",
        String        = "𝓢 ", -- 
        Number        = "# ", -- 󰎠
        Boolean       = "◩ ",
        Array         = "󰅪 ",
        Object        = " ", -- 󰅩
        Key           = "󰌋 ",
        Null          = " ", -- 󰟢
        EnumMember    = " ",
        Struct        = " ", -- 󰌗
        Event         = " ", -- 
        Operator      = "󰆕 ",
        TypeParameter = "󰊄 ",
      },
      mappings = {
        ["<Down>"] = actions.next_sibling(),   -- down
        ["<Up>"] = actions.previous_sibling(), -- up
        ["<Left>"] = actions.parent(),         -- Move to left panel
        ["<Right>"] = actions.children()       -- Move to right panel
      },
      window = {
        border = "rounded",
        size = "90%",
        sections = { left = { size = "30%" }, mid = { size = "40%" } }
      }
    })
  end
}
