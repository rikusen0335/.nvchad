local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    enabled = false,
    opts = overrides.nvimtree,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    -- enabled = false,
    opts = overrides.blankline,
  },
  {
    "hrsh7th/nvim-cmp",
    opts = overrides.cmp,
    dependencies = {
      -- "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-emoji",
      "hrsh7th/cmp-calc",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "f3fora/cmp-spell",
      -- "hrsh7th/cmp-path",
      "hrsh7th/cmp-vsnip",
      "delphinus/cmp-ctags",
      "hrsh7th/cmp-nvim-lsp-document-symbol",
      "hrsh7th/cmp-copilot",
      "ray-x/cmp-treesitter",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      { "jcdickinson/codeium.nvim", config = true },
      {
        "tzachar/cmp-tabnine",
        build = "./install.sh",
        config = function()
          local tabnine = require "cmp_tabnine.config"
          tabnine:setup {} -- put your options here
        end,
      },
    },
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },
  {
   "nvim-telescope/telescope.nvim",
    dependencies = {
      {
        "nvim-telescope/telescope-file-browser.nvim",
        config = function() require("telescope").load_extension "file_browser" end,
      },
      {
        "nvim-telescope/telescope-frecency.nvim",
        dependencies = {
          "kkharji/sqlite.lua",
        },
        config = function() require("telescope").load_extension "frecency" end,
      },
      {
        "nvim-telescope/telescope-media-files.nvim",
        config = function() require('telescope').load_extension "media_files" end,
      },
    },
    opts = overrides.telescope,
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    event = "VeryLazy",
    config = function()
      require("telescope").load_extension "ui-select"
    end,
  },
  {
    "olimorris/persisted.nvim",
    lazy = false,
    config = function()
      require("persisted").setup({
        autoload = true
      })
    end
  },
  {
    "lvimuser/lsp-inlayhints.nvim",
    event = "LspAttach",
    config = function()
      require "custom.configs.lsp-inlayhints"
    end,
  },
  {
    "folke/noice.nvim",
    lazy = false,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    config = function()
      require "custom.configs.noice"
    end,
  },
  {
    "folke/trouble.nvim",
    cmd = { "TroubleToggle", "Trouble" },
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require "custom.configs.trouble"
    end,
  },
  {
    "karb94/neoscroll.nvim",
    keys = { "<C-d>", "<C-u>" },
    config = function()
      require("neoscroll").setup { mappings = {
        "<C-u>",
        "<C-d>",
      } }
    end,
  },
  {
    "echasnovski/mini.nvim",
    event = "VeryLazy",
    config = function()
      require("mini.animate").setup {
        scroll = {
          enable = false,
        },
      }
    end,
  },
  {
    'lewis6991/satellite.nvim',
    lazy = false,
    config = function()
      require('satellite').setup()
    end,
  },
  {
    "ray-x/go.nvim",
    ft = { "go", "gomod" },
    dependencies = { {
      "ray-x/guihua.lua",
      build = "cd lua/fzy && make",
    }, "nvim-treesitter" },
    config = function()
      require "custom.configs.go"
    end,
  },
  {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    -- ft = { "go", "gomod" },
    keys = { "<leader>ls" },
    config = function()
      require("lsp_lines").setup()
    end,
  },
  {
    "simnalamburt/vim-mundo",
    lazy = false,
  },
  {
    "f-person/git-blame.nvim",
    cmd = "GitBlameToggle",
  },
  { "mfussenegger/nvim-dap", event = "VeryLazy" },
  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = { "theHamsta/nvim-dap-virtual-text", config = true },
  },
  {
    "mrjones2014/nvim-ts-rainbow",
    event = "BufReadPost",
    dependencies = "nvim-treesitter",
  },
  {
    "folke/todo-comments.nvim",
    event = "BufWinEnter",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require "custom.configs.todo"
    end,
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "BufReadPost",
    config = true,
  },
  {
    "melkster/modicator.nvim",
    event = "BufWinEnter",
    config = function()
      require "custom.configs.modicator"
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = "BufWinEnter",
    config = function()
      require "custom.configs.ts-context"
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    event = "BufWinEnter",
    config = function()
      require "custom.configs.textobjects"
    end,
  },
  {
    "sindrets/diffview.nvim",
    cmd = "DiffviewOpen",
    config = true,
  },
  {
    "tenxsoydev/karen-yank.nvim",
    event = "VeryLazy",
    config = true,
  },
  {
    "chikko80/error-lens.nvim",
    event = "LspAttach",
    ft = "go",
    config = true,
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
  },
  {
    "smjonas/inc-rename.nvim",
    event = "LspAttach",
    config = true,
  },
  {
    "kevinhwang91/nvim-hlslens",
    event = "BufReadPost",
    config = function()
      require("hlslens").setup()
    end,
  },
  {
    "petertriho/nvim-scrollbar",
    event = "VimEnter",
    config = true,
  },
  {
    "m-demare/hlargs.nvim",
    event = "BufWinEnter",
    config = function()
      require("hlargs").setup()
    end,
  },
  {
    "anuvyklack/pretty-fold.nvim",
    event = "BufWinEnter",
    dependencies = {
      {
        "anuvyklack/fold-preview.nvim",
        dependencies = {
          "anuvyklack/keymap-amend.nvim",
        },
        opts = {
          border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
        },
      },
    },
    config = function()
      require "custom.configs.pretty-fold"
    end,
  },
  {
    "edluffy/specs.nvim",
    event = "VeryLazy",
  },
  {
    "j-hui/fidget.nvim",
    lazy = false,
  },
  {
    "hrsh7th/cmp-cmdline",
    event = "VeryLazy",
  },
  {
    "vuki656/package-info.nvim",
    ft = { "json", "lua" },
    config = true,
  },
  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }
}

return plugins
