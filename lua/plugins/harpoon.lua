-- basic telescope configuration
local conf = require("telescope.config").values
local function toggle_telescope(harpoon_files)
  local file_paths = {}
  for _, item in ipairs(harpoon_files.items) do
    table.insert(file_paths, item.value)
  end

  require("telescope.pickers").new({}, {
    prompt_title = "Harpoon",
    finder = require("telescope.finders").new_table({
      results = file_paths,
    }),
    previewer = conf.file_previewer({}),
    sorter = conf.generic_sorter({}),
  }):find()
end

return {
  "theprimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("harpoon"):setup()
  end,
  keys = {
    { "<leader>hm", function() require("harpoon"):list():append() end,                     desc = "harpoon file", },
    {
      "<leader>ha",
      function()
        local harpoon = require("harpoon")
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end,
      desc = "harpoon quick menu",
    },
    -- Toggle previous & next buffers stored within Harpoon list
    { "<C-b>",      function() require("harpoon"):list():next({ ui_nav_wrap = true }) end, desc = "Harpoon next file", },
    { "<C-x>",      function() require("harpoon"):list():prev({ ui_nav_wrap = true }) end, desc = "Harpoon previous file", },
    { "<leader>hr", function() require("harpoon"):list():remove() end,                     desc = "Removes current marker from list", },
    { "<leader>hl", function() toggle_telescope(require("harpoon"):list()) end,            desc = "Displays markers using Telescope", },
    -- { "<leader>3",  function() require("harpoon"):list():select(3) end, desc = "harpoon to file 3", },
    -- { "<leader>4",  function() require("harpoon"):list():select(4) end, desc = "harpoon to file 4", },
    -- { "<leader>5",  function() require("harpoon"):list():select(5) end, desc = "harpoon to file 5", },
  },
}
