-- oil.nvim: edit the filesystem like a Neovim buffer
-- Navigate with hjkl, rename/delete/move with normal vim commands, :w to apply
return {
  {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = false,
    opts = {
      -- Show dotfiles by default (toggle with g.)
      view_options = {
        show_hidden = false,
      },
      -- Keep netrw disabled
      default_file_explorer = true,
      keymaps = {
        ["g?"] = "actions.show_help",
        ["<CR>"] = "actions.select",
        ["-"]    = "actions.parent",
        ["_"]    = "actions.open_cwd",
        ["gs"]   = "actions.change_sort",
        ["g."]   = "actions.toggle_hidden",
        ["q"]    = "actions.close",
      },
    },
    keys = {
      { "-", "<cmd>Oil<cr>", desc = "Oil: open parent dir" },
    },
  },
}
