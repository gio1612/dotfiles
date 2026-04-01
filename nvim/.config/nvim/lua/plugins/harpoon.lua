-- Harpoon 2: mark and instantly jump to frequently used files
return {
  {
    "ThePrimeagen/harpoon",
    branch       = "harpoon2",
    lazy         = false,
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local harpoon = require("harpoon")
      harpoon:setup()

      local map = vim.keymap.set

      -- Add current file to harpoon list
      map("n", "<leader>a", function() harpoon:list():add() end,            { desc = "Harpoon: add file" })

      -- Toggle the harpoon quick-menu
      map("n", "<C-e>",     function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Harpoon: menu" })

      -- Jump to marked files with <leader>h/j/k/l (slots 1-4)
      map("n", "<leader>h", function() harpoon:list():select(1) end,        { desc = "Harpoon: file 1" })
      map("n", "<leader>j", function() harpoon:list():select(2) end,        { desc = "Harpoon: file 2" })
      map("n", "<leader>k", function() harpoon:list():select(3) end,        { desc = "Harpoon: file 3" })
      map("n", "<leader>l", function() harpoon:list():select(4) end,        { desc = "Harpoon: file 4" })

      -- Cycle through harpoon list
      map("n", "[h",        function() harpoon:list():prev() end,           { desc = "Harpoon: prev" })
      map("n", "]h",        function() harpoon:list():next() end,           { desc = "Harpoon: next" })
    end,
  },
}
