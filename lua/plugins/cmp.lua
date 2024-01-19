-- Snippets of config that I am removing for now and might need later
-- vim.api.nvim_set_hl(0, "Pmenu", { fg = "#8ec07c" })
-- vim.api.nvim_set_hl(0, "PmenuSel", { fg = "#191D24", bg = "#83a598", bold = true, italic = true })
-- -- previous color #e7d7ad
-- vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#8ec07c", bg = "#242424" })
-- vim.api.nvim_set_hl(0, "CmpItemAbbr", { fg = "#cc241d" })
-- vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { fg = "#98971a" })
-- vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { fg = "#eebd35" })

return {
  "hrsh7th/nvim-cmp",
  version = false, -- last release is way too old
  lazy = true,
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "saadparwaiz1/cmp_luasnip",
    {
      "zbirenbaum/copilot-cmp",
      dependencies = "copilot.lua",
      opts = {},
      config = function(_, opts)
        local copilot_cmp = require("copilot_cmp")
        copilot_cmp.setup(opts)
        -- attach cmp source whenever copilot attaches
        -- fixes lazy-loading issues with the copilot cmp source
        require("lazyvim.util").lsp.on_attach(function(client)
          if client.name == "copilot" then
            copilot_cmp._on_insert_enter({})
          end
        end)
      end,
    },
  },
  opts = function()
    -- Transparency level on the CMP menu
    vim.opt.pumblend = 0
    vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
    local cmp = require("cmp")
    local defaults = require("cmp.config.default")()
    local compare = require("cmp.config.compare")
    vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#8ec07c", bg = "#242424" })

    --- Code to fetch package name from which lsp suggestions are coming from
    ---@param entry cmp.Entry
    ---@return string|nil
    local function get_python_import(entry)
      local cmp_item = entry:get_completion_item()                  --- @type lsp.CompletionItem
      if cmp_item.detail == "Auto-import" then
        return (cmp_item.labelDetails or {}).description or '[LSP]' -- pyright-specific (undocumented)
      end
      return nil                                                    -- no information, possibly not auto-import symbol
    end

    return {
      view = {
        entries = { name = "custom", selection_order = "near_cursor" },
      },
      window = {
        documentation = {
          winhighlight = "Normal:Pmenu,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
          border = "rounded",
        },
        completion = {
          col_offset = -3,
          side_padding = 1,
          winhighlight = "Normal:Pmenu,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
          border = "rounded",
          scrollbar = false,
          direction = "above",
        },
      },
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ["<S-CR>"] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ["<C-CR>"] = function(fallback)
          cmp.abort()
          fallback()
        end,
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp", priority = 4 },
        { name = "luasnip",  priority = 3 },
        { name = "path",     priority = 2 },
        { name = "buffer",   priority = 1 },
        {
          name = "copilot",
          group_index = 1,
          priority = 100,
        }
      }),
      formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(entry, item)
          local icons = require("lazyvim.config").icons.kinds
          local half_win_width = math.floor(vim.api.nvim_win_get_width(0) / 2)
          if vim.api.nvim_strwidth(item.abbr) > half_win_width then
            item.abbr = ("%s…"):format(item.abbr:sub(1, half_win_width))
          end
          item.abbr = ("%s "):format(item.abbr)
          item.kind = string.format("%s", icons[item.kind], item.kind)
          item.menu = ({
            nvim_lsp = get_python_import(entry),
            luasnip = "[LuaSnip]",
            nvim_lua = "[API]",
            path = "[Path]",
            buffer = "[Buf]",
          })[entry.source.name]
          return item
        end,
      },
      experimental = {
        ghost_text = {
          hl_group = "CmpGhostText",
        },
      },
      sorting = defaults.sorting,
    }
  end,
  ---@param opts cmp.ConfigSchema
  config = function(_, opts)
    for _, source in ipairs(opts.sources) do
      source.group_index = source.group_index or 1
    end
    require("cmp").setup(opts)
  end,
}
