return {
  "nvim-treesitter/nvim-treesitter",
  lazy = true,
  event = "BufReadPre",
  dependencies = { "andymass/vim-matchup" },
  opts = { matchup = { enable = true } },
}
