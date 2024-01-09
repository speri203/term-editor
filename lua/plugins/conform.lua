-- Conform is a LSP formatter that tries to fix bad-behaving LSP formatters.
-- The plugin is installed by default from LazyVim but will currently have it
-- disabled until I require it
return {
  "stevearc/conform.nvim",
  opts = function()
    ---@class ConformOpts
    local opts = {
      ---@type table<string, conform.FormatterUnit[]>
      formatters_by_ft = {
        python = { "blue" },
      },
    }
    return opts
  end,
}
