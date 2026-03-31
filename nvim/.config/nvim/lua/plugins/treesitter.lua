-- Treesitter: syntax highlighting, text objects
return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "lua", "vim", "vimdoc",
          "python", "javascript", "typescript",
          "go", "rust",
          "bash", "json", "yaml", "toml", "markdown",
        },
        highlight = { enable = true },
        indent    = { enable = true },
      })
    end,
  },
}
