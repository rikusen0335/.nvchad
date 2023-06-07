local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "bash",
    "html",
    "css",
    "json5",
    "javascript",
    "typescript",
    "tsx",
    "gomod",
    "gowork",
    "go",
    "gosum",
    "yaml",
    "dockerfile",
    "regex",
    "c",
    "markdown",
    "markdown_inline",
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "deno",
    "prettier",

    -- c/cpp stuff
    "clangd",
    "clang-format",

    -- golang
    "gopls",
    "goimports",
    "golines",
    "gomodifytags",
    "sonarlint-language-server",
  },
}

M.telescope = {
  defaults = {
    file_ignore_patterns = { "node_modules", ".docker", ".git", "yarn.lock", "go.sum", "go.mod", "tags" },
  },
  extensions_list = {
    "themes",
    -- "terms",
    "notify",
    "frecency",
    -- "undo",
    -- "vim_bookmarks",
    -- "harpoon",
    -- "package_info",
    -- "lazy",
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    },
    lazy = {
      -- Whether or not to show the icon in the first column
      show_icon = true,
      -- Mappings for the actions
      mappings = {
        open_in_browser = "<C-o>",
        open_in_file_browser = "<M-b>",
        open_in_find_files = "<C-f>",
        open_in_live_grep = "<C-g>",
        open_plugins_picker = "<C-b>", -- Works only after having called first another action
        open_lazy_root_find_files = "<C-r>f",
        open_lazy_root_live_grep = "<C-r>g",
      },
      -- Other telescope configuration options
    },
    file_browser = {
      cwd_to_path = true,
    },
  },
}

-- git support in nvimtree
M.nvimtree = {
  enabled = false,

  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

M.blankline = {
  filetype_exclude = {
    "help",
    "terminal",
    "lspinfo",
    "TelescopePrompt",
    "TelescopeResults",
    "nvcheatsheet",
    "lsp-installer",
    "norg",
    "Empty",
    "",
  },
  -- char = "¦",
  -- context_char = "¦",
  buftype_exclude = { "terminal", "nofile" },
  show_end_of_line = true,
  show_foldtext = true,
  show_trailing_blankline_indent = false,
  show_first_indent_level = false,
  show_current_context = true,
  show_current_context_start = true,
  vim.api.nvim_set_hl(0, "IndentBlanklineContextChar", { nocombine = true, fg = "none" }),
  vim.api.nvim_set_hl(0, "IndentBlanklineContextStart", { nocombine = false, underline = false, special = "none" }),
}

M.cmp = {
  mapping = {
    ["<Up>"] = require("cmp").mapping.select_prev_item(),
    ["<Down>"] = require("cmp").mapping.select_next_item(),
    ["<Tab>"] = {},
    -- ["<CR>"] = require("cmp").mapping({
    --   i = function(fallback)
    --     if require("cmp").visible() and require("cmp").get_active_entry() then
    --       require("cmp").confirm({ behavior = require("cmp").ConfirmBehavior.Replace, select = false })
    --     else
    --       fallback()
    --     end
    --   end,
    --   s = require("cmp").mapping.confirm({ select = true }),
    --   c = require("cmp").mapping.confirm({ behavior = require("cmp").ConfirmBehavior.Replace, select = true }),
    -- }),
    ["<ESC>"] = require("cmp").mapping.abort(),
    -- ["<Tab>"] = require("cmp").mapping(function(fallback)
    --   local luasnip = require "luasnip"
    --   local copilot_keys = vim.fn["copilot#Accept"]()
    --   if require("cmp").visible() then
    --     require("cmp").select_next_item()
    --   elseif luasnip.expand_or_jumpable() then
    --     luasnip.expand_or_jump()
    --   elseif copilot_keys ~= "" and type(copilot_keys) == "string" then
    --     vim.api.nvim_feedkeys(copilot_keys, "i", true)
    --     -- vim.api.nvim_feedkeys(vim.fn['copilot#Accept'](vim.api.nvim_replace_termcodes('<Tab>', true, true, true)), 'n', true)
    --   else
    --     fallback()
    --   end
    -- end, {
    --   "i",
    --   "s",
    -- }),
  },
  sources = {
    { name = "copilot" },
    { name = "nvim_lsp" },
    { name = "codeium" },
    { name = "cmp_tabnine" },
    -- { name = "luasnip" },
    -- { name = "nvim_lua" },
    { name = "path" },
    { name = "treesitter" },
    { name = "nvim_lsp_signature_help" },
    { name = "nvim_lsp_document_symbol" },
    { name = "vim_lsp" },
    { name = "buffer", keyword_length = 3 },
    { name = "spell" },
  },
}

return M
