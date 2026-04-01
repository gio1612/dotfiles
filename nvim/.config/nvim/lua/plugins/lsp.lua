-- LSP: mason + native vim.lsp.config API (Neovim 0.11+) + completions
return {
  -- Mason: installs LSP server binaries into ~/.local/share/nvim/mason/bin/
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    opts = {},
  },
  -- mason-lspconfig: auto-installs the listed servers via Mason
  -- No lspconfig wiring needed — we use the native vim.lsp API below
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "pyright",
          "ts_ls",
          "gopls",
          "rust_analyzer",
          "bashls",
        },
      })

      -- Advertise nvim-cmp completion capabilities to every server
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      vim.lsp.config("*", { capabilities = capabilities })

      -- LspAttach: buffer-local keymaps (Neovim 0.11+)
      -- K (hover), gd, grn, gra, grr are now built-in defaults — only map extras
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(ev)
          local map = function(keys, func, desc)
            vim.keymap.set("n", keys, func, { buffer = ev.buf, desc = "LSP: " .. desc })
          end
          map("gD",         vim.lsp.buf.declaration,                             "Go to declaration")
          map("<leader>rn", vim.lsp.buf.rename,                                  "Rename")
          map("<leader>ca", vim.lsp.buf.code_action,                             "Code action")
          map("<leader>f",  function() vim.lsp.buf.format({ async = true }) end, "Format file")
        end,
      })

      -- ── Server configurations ──────────────────────────────────────────────

      vim.lsp.config("lua_ls", {
        cmd           = { "lua-language-server" },
        filetypes     = { "lua" },
        root_markers  = { { ".luarc.json", ".luarc.jsonc" }, ".git" },
        settings = {
          Lua = {
            runtime  = { version = "LuaJIT" },
            workspace = {
              checkThirdParty = false,
              library         = { vim.env.VIMRUNTIME },
            },
          },
        },
      })

      vim.lsp.config("pyright", {
        cmd          = { "pyright-langserver", "--stdio" },
        filetypes    = { "python" },
        root_markers = { "pyproject.toml", "setup.py", "requirements.txt", ".git" },
      })

      vim.lsp.config("ts_ls", {
        cmd          = { "typescript-language-server", "--stdio" },
        filetypes    = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
        root_markers = { "tsconfig.json", "package.json", ".git" },
      })

      vim.lsp.config("gopls", {
        cmd          = { "gopls" },
        filetypes    = { "go", "gomod", "gowork", "gotmpl" },
        root_markers = { "go.mod", "go.work", ".git" },
      })

      vim.lsp.config("rust_analyzer", {
        cmd          = { "rust-analyzer" },
        filetypes    = { "rust" },
        root_markers = { "Cargo.toml", ".git" },
      })

      vim.lsp.config("bashls", {
        cmd          = { "bash-language-server", "start" },
        filetypes    = { "sh", "bash" },
        root_markers = { ".git" },
      })

      -- Enable all configured servers (auto-starts on matching filetypes)
      vim.lsp.enable({
        "lua_ls", "pyright", "ts_ls", "gopls", "rust_analyzer", "bashls",
      })
    end,
  },
  -- Completions
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      local cmp     = require("cmp")
      local luasnip = require("luasnip")

      cmp.setup({
        snippet = {
          expand = function(args) luasnip.lsp_expand(args.body) end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"]      = cmp.mapping.confirm({ select = true }),
          ["<Tab>"]     = cmp.mapping(function(fallback)
            if cmp.visible() then cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then luasnip.expand_or_jump()
            else fallback() end
          end, { "i", "s" }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" },
        }),
      })
    end,
  },
}
