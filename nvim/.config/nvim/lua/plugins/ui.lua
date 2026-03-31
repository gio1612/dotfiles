-- UI plugins: statusline, icons, indent guides
return {
  -- Statusline (replaces powerline from old vimrc)
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = {
        theme = "gruvbox",
        component_separators = "|",
        section_separators = "",
      },
    },
  },
  -- File icons
  { "nvim-tree/nvim-web-devicons", lazy = true },
  -- Indent guides
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
  },
}
