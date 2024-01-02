-- Load vim configurations
vim.g.mapleader = " " -- Set mapleader
-- Check weather Lazy.nvim is installes, if not, install
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Plugins
require("lazy").setup({
  -- Themes
  { "catppuccin/nvim",     name = "catppuccin",       priority = 1000 },
  -- LazyVim, will get rid of it sooner, or later
  { "LazyVim/LazyVim",     import = "lazyvim.plugins" },
  -- Other tools
  { "jiangmiao/auto-pairs" },
  { 'evanleck/vim-svelte' },
})

require("notify").setup({
  background_colour = "#000000",
})

require("config.settings")
-- Load themes
require("themes.catppuccin")
