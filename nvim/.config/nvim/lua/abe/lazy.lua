local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({

    {
      {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
          library = {
            -- See the configuration section for more details
            -- Load luvit types when the `vim.uv` word is found
            { path = "luvit-meta/library", words = { "vim%.uv" } },
          },
        },
      },
      { "Bilal2453/luvit-meta", lazy = true }, -- optional `vim.uv` typings
      { -- optional completion source for require statements and module annotations
        "hrsh7th/nvim-cmp",
        opts = function(_, opts)
          opts.sources = opts.sources or {}
          table.insert(opts.sources, {
            name = "lazydev",
            group_index = 0, -- set group index to 0 to skip loading LuaLS completions
          })
        end,
      },
      -- { "folke/neodev.nvim", enabled = false }, -- make sure to uninstall or disable neodev.nvim
    },

    {
      "morhetz/gruvbox", 
      name = "gruvbox",
      priority = 1000,
      lazy = false,
      config = function()
          vim.cmd([[colorscheme gruvbox]])
      end,
    },


    {
      "nvim-telescope/telescope.nvim",
      name = "telescope",
      dependencies = {'nvim-lua/plenary.nvim'},
    },


    { 'nvim-telescope/telescope-fzf-native.nvim', 
    build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
    },


    {
      'nvim-treesitter/nvim-treesitter',
      name = "treesitter",
      build = ":TSUpdate",
    },


    {
      'theprimeagen/harpoon',
      name = "harpoon",
      branch = "harpoon2",
      dependencies = {"nvim-lua/plenary.nvim"},
    },


    {
      "nvim-lualine/lualine.nvim",
      name = "lualine",
      dependencies = {"kyazdani42/nvim-web-devicons"},
    },


    {
      "neovim/nvim-lspconfig",
      dependencies = { "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim" }
    },


    {
      'lukas-reineke/indent-blankline.nvim'
    }, -- Add indentation guides even on blank lines


    {
      'numToStr/Comment.nvim'
    }, -- "gc" to comment visual regions/lines


    {
      'tpope/vim-sleuth'
    }, -- Detect tabstop and shiftwidth automatically


    {
      'j-hui/fidget.nvim'
    },
    {
      'stevearc/dressing.nvim'

    },

    {
    'hrsh7th/nvim-cmp',
    dependencies = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' },
    },
})

-- use {
--         'windwp/nvim-autopairs',
--         config = function() require("nvim-autopairs").setup {} end
--     }
--
-- use { -- LSP Configuration & Plugins
--    'neovim/nvim-lspconfig',
--    requires = {
--      -- Automatically install LSPs to stdpath for neovim
--      'williamboman/mason.nvim',
--      'williamboman/mason-lspconfig.nvim',
--
--      -- Additional lua configuration, makes nvim stuff amazing
--      'folke/neodev.nvim',
--    },
--  }
--
--  use { -- Autocompletion
--    'hrsh7th/nvim-cmp',
--    requires = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' },
--  }
--
--     {
--      'lukas-reineke/indent-blankline.nvim'
--    }, -- Add indentation guides even on blank lines
--
--     {
 --     'numToStr/Comment.nvim'
   -- }, -- "gc" to comment visual regions/lines
--
--     {
  --    'tpope/vim-sleuth'
    --}, -- Detect tabstop and shiftwidth automatically
--
--     {
   --   {'j-hui/fidget.nvim'
    --},,
--	tag='legacy'
--  }
