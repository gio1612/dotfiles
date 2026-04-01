-- flash.nvim: fast 2-char jump anywhere on screen
-- s<char><char> → jump; S → treesitter-aware selection
return {
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts  = {},
    keys  = {
      { "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash: jump" },
      { "S",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash: treesitter select" },
      { "r",     mode = "o",               function() require("flash").remote() end,             desc = "Flash: remote operator" },
      { "<C-s>", mode = { "c" },           function() require("flash").toggle() end,             desc = "Flash: toggle in search" },
    },
  },
}
