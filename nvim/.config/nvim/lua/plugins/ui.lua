-- UI plugins: statusline, icons, indent guides
return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = {
        theme                = "gruvbox",
        component_separators = "|",
        section_separators   = "",
        globalstatus         = true,   -- single bar across all splits
      },
      sections = {
        lualine_a = { { "mode", fmt = function(s) return s:sub(1, 1) end } },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { { "filename", path = 1, symbols = { modified = " ●", readonly = " ", unnamed = "[No Name]" } } },
        lualine_x = { "lsp_status", "filetype" },
        lualine_y = {},
        lualine_z = { "location" },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { { "filename", path = 1 } },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },
    },
  },
  -- File icons (used by lualine filetype component and Telescope)
  { "nvim-tree/nvim-web-devicons", lazy = true },
  -- Indent guides
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
  },
}
