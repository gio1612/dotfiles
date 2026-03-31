-- init.lua — Neovim config (migrated from vimrc, powered by lazy.nvim)

-- ── Bootstrap lazy.nvim ───────────────────────────────────────────────────────
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- ── Options (migrated from vimrc) ────────────────────────────────────────────
local opt = vim.opt

opt.relativenumber = true
opt.number         = true
opt.hlsearch       = false
opt.incsearch      = true
opt.ignorecase     = true
opt.smartcase      = true

opt.tabstop        = 2
opt.softtabstop    = 2
opt.shiftwidth     = 2
opt.expandtab      = true
opt.smartindent    = true

opt.wrap           = false
opt.hidden         = true
opt.scrolloff      = 8
opt.colorcolumn    = "80"
opt.cmdheight      = 1
opt.updatetime     = 50
opt.signcolumn     = "yes"

opt.swapfile       = false
opt.backup         = false
opt.undofile       = true
opt.undodir        = vim.fn.expand("~/.vim/undodir")

opt.termguicolors  = true

-- Leader key
vim.g.mapleader = " "

-- ── Plugins ───────────────────────────────────────────────────────────────────
require("lazy").setup("plugins", {
  change_detection = { notify = false },
})

-- ── Keymaps ───────────────────────────────────────────────────────────────────
local map = vim.keymap.set

-- Navigation
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- Move lines in visual mode
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- Keep cursor centered on search
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- Telescope
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>")
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")

-- LSP (set in lsp config, but leader shortcuts here)
map("n", "<leader>e", vim.diagnostic.open_float)
map("n", "[d", vim.diagnostic.goto_prev)
map("n", "]d", vim.diagnostic.goto_next)
