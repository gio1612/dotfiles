-- Treesitter: parser management + syntax highlighting + indentation
-- Uses the new nvim-treesitter main-branch API (configs module removed)
return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy  = false,
    build = ":TSUpdate",
    config = function()
      -- Install parsers (async by default)
      require("nvim-treesitter").install({
        "lua", "vim", "vimdoc",
        "python", "javascript", "typescript",
        "go", "rust",
        "bash", "json", "yaml", "toml", "markdown",
      })

      -- Enable treesitter features per filetype via autocmd
      -- vim.treesitter.start()  → highlighting (Neovim built-in, no configs module needed)
      -- indentexpr              → indentation (provided by nvim-treesitter)
      vim.api.nvim_create_autocmd("FileType", {
        callback = function(ev)
          local lang = vim.treesitter.language.get_lang(ev.match) or ev.match
          local ok   = pcall(vim.treesitter.language.inspect, lang)
          if ok then
            vim.treesitter.start()
            vim.bo[ev.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
          end
        end,
      })
    end,
  },
}
