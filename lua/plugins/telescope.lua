return {
  "nvim-telescope/telescope.nvim",
  defaults = {
    file_ignore_patterns = {
      "node_modules/.*",
      ".git/.*",
      ".venv/.*",
    },
  },
  keys = {
    -- disable the keymap to grep files
    { "<leader>/",  false },
    { "<leader>fw", "<cmd>Telescope live_grep<cr>",  desc = "Find Word (live_grep)" },
    -- change a keymap
    { "<leader> ",  "<cmd>Telescope find_files<cr>", desc = "Find Files" },
    -- add a keymap to browse plugin files
    {
      "<leader>fp",
      function()
        require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root })
      end,
      desc = "Find Plugin File",
    },
  },
}
