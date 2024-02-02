return {
  "folke/which-key.nvim",
  lazy = true,
  event = "BufWinEnter",
  opts = function(_, opts)
    if require("lazyvim.util").has("noice.nvim") then
      opts.defaults["<leader>sn"] = { name = "+noice" }
    end
  end,
}
