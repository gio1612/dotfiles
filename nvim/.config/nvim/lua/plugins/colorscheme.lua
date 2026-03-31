-- Gruvbox colorscheme (kept from original vimrc)
return {
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = function()
      vim.o.background = "dark"
      require("gruvbox").setup({
        contrast = "hard",
        transparent_mode = false,
      })
      vim.cmd.colorscheme("gruvbox")
    end,
  },
}
