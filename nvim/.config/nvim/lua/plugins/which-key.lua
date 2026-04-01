-- which-key: shows available keybindings after a prefix pause
return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts  = {
      delay = 500,  -- ms before popup appears
    },
    config = function(_, opts)
      local wk = require("which-key")
      wk.setup(opts)

      -- Label leader prefix groups so the popup is readable
      wk.add({
        { "<leader>f", group = "find (telescope)" },
        { "<leader>h", desc  = "Harpoon: file 1" },
        { "<leader>j", desc  = "Harpoon: file 2" },
        { "<leader>k", desc  = "Harpoon: file 3" },
        { "<leader>l", desc  = "Harpoon: file 4" },
        { "<leader>a", desc  = "Harpoon: add file" },
        { "<leader>e", desc  = "LSP: diagnostics float" },
        { "<leader>p", desc  = "Paste (no clobber)" },
        { "<leader>y", desc  = "Yank to clipboard" },
        { "<leader>d", desc  = "Delete to black hole" },
      })
    end,
  },
}
