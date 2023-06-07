---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<leader>fb"] = { "<cmd>Telescope file_browser path=%:p:h select_buffer=true<cr>", desc = "File explorer" },
  },
}

-- more keybinds!
M.tabufline = {
  n = {
    ["]b"] = {
      function()
        require("nvchad_ui.tabufline").tabuflineNext()
      end,
      "Goto next buffer",
    },
    ["[b"] = {
      function()
        require("nvchad_ui.tabufline").tabuflinePrev()
      end,
      "Goto previous buffer",
    },
    ["<leader>c"] = {
      function()
        require("nvchad_ui.tabufline").close_buffer()
      end,
      "Close buffer",
    },
  }
}

M.lspconfig = {
  n = {
    ["<leader>la"] = {
      function()
        vim.lsp.buf.code_action()
      end,
      "LSP code action",
    },
  }
}

return M
