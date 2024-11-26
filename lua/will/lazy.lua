-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  { 'kamykn/spelunker.vim',         lazy = false },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate"
  },
  {
    "VonHeikemen/lsp-zero.nvim",
    lazy = false,
    dependencies = {
      { 'neovim/nvim-lspconfig',             lazy = false },
      { 'williamboman/mason.nvim',           lazy = false },
      { 'williamboman/mason-lspconfig.nvim', lazy = false },
      -- Autocompletion
      { 'hrsh7th/nvim-cmp',                  lazy = false },
      { 'hrsh7th/cmp-buffer',                lazy = false },
      { 'hrsh7th/cmp-path',                  lazy = false },
      { 'saadparwaiz1/cmp_luasnip',          lazy = false },
      { 'hrsh7th/cmp-nvim-lsp',              lazy = false },
      { 'hrsh7th/cmp-nvim-lua',              lazy = false },

      -- Snippets
      { 'L3MON4D3/LuaSnip',                  lazy = false },
      { 'rafamadriz/friendly-snippets',      lazy = false },
    }
  },
  {
    'phaazon/hop.nvim',
    branch = 'v2', -- optional but strongly recommended
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require 'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
    end
  },
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
    --    tag = 'nightly'                  -- optional, updated every week. (see issue #1193)
  },
  {
    'nvim-lualine/lualine.nvim'
  },
  { 'kyazdani42/nvim-web-devicons', lazy = true },

  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  },
  { 'voldikss/vim-floaterm' },
  {
    "folke/tokyonight.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000,
    config = function()
      vim.cmd("colorscheme tokyonight-moon")
    end,
  },

  checker = { enabled = true },
})
