-- Plugin overrides the default behavior of d and dd, where it doesn't overwrite
-- what is in your clipboard
return {
  "gbprod/cutlass.nvim",
  lazy = true,
  event = { "BufEnter" },
  opts = {},
}
