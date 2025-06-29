-----@diagnostic disable: undefined-global
-- hop
local hop = require('hop')
local directions = require('hop.hint').HintDirection
vim.keymap.set('', 'f', function()
  hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
end, { silent = true })
vim.keymap.set('', 'F', function()
  hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
end, { silent = true })


vim.keymap.set('n', '<leader>fm', "<cmd>lua vim.lsp.buf.format { async = true }<CR>", { desc = "Lsp format" })
vim.keymap.set('n', 'gd', "<cmd>lua vim.lsp.buf.definition()<CR>", { desc = "Goto Definition" })
vim.keymap.set('n', '<leader>ca', "<cmd>lua vim.lsp.buf.code_action()<CR>", { desc = "Code action" })
vim.keymap.set('n', '<leader>r', "<cmd>lua vim.lsp.buf.rename()<CR>", { desc = "Lsp Rename" })
-- vim.keymap.set('n', 'gh', "<cmd>lua vim.lsp.buf.hover()<CR>", { desc = "Lsp Hover" })
vim.keymap.set('n', 'gh', function()
  vim.lsp.buf.hover({
    border = "rounded"
  })
end, { desc = "Lsp Hover" })

vim.keymap.set('n', 'gl', "<cmd>lua vim.diagnostic.open_float()<CR>", { desc = "Diagnostic" })
vim.diagnostic.config({
  float = {
    border = "rounded",
  }
})

-- if not vim.g.vscode then
--   -- blink.cmp ghost color
--   vim.api.nvim_set_hl(0, 'BlinkCmpGhostText', { fg = '#5E81AC' })
--
--   -- lsp
--   local capabilities = require('blink.cmp').get_lsp_capabilities()
--   local lspconfig = require('lspconfig')
--
--   lspconfig['lua_ls'].setup({ capabilities = capabilities })
--   lspconfig['gopls'].setup({ capabilities = capabilities })
--   lspconfig['ruff'].setup({ capabilities = capabilities })
--   lspconfig['vtsls'].setup({ capabilities = capabilities })
--   lspconfig['bashls'].setup({ capabilities = capabilities })
--
--   local clangd_capabilities = require("blink.cmp").get_lsp_capabilities()
--   clangd_capabilities.offsetEncoding = { "utf-16" }
--   require("lspconfig")['clangd'].setup {
--     capabilities = clangd_capabilities
--   }
-- end


-- copilot
-- vim.keymap.set('i', '<C-l>', 'copilot#Accept("\\<CR>")', {
--   expr = true,
--   replace_keycodes = false
-- })
-- vim.g.copilot_no_tab_map = true

--- buffer line
vim.opt.termguicolors = true,

-- avante
vim.keymap.set("n", "ta", "<cmd>AvanteToggle<CR>", { desc = "Toggle Avante" })
vim.keymap.set("v", "<leader>ta", "<cmd>AvanteAsk<CR>", { desc = "Avante Ask" })
vim.keymap.set("v", "<leader>te", "<cmd>AvanteEdit<CR>", { desc = "Avante Edit" })

-- which key
local wk = require("which-key")
wk.add({
  { "<leader>b", group = "Buffer" },
  { "<leader>x", group = "Trouble", icon = "󱪊 " },
  { "<leader>w", group = "Warp & Save", icon = " " },
  { "<leader>u", group = "Spell", icon = " " },
  { "<leader>f", group = "Search, Aerial & format" },
  { "<leader>c", group = "Lsp", icon = " " },
  { "<leader>g", group = "Terminal & gitsigns" },
  { "<leader>q", group = "Quit" },
  { "<leader>l", "<cmd>Lazy<cr>", icon = "󰒲 " },
  { "t", group = "Tab" },
  { "gr", group = "Lsp", icon = " ", mode = { "n", "v" } },
  { "gT", hidden = true, mode = { "n", "v" } },
  { "ge", hidden = true, mode = { "n", "v" } },
  { "gg", hidden = true, mode = { "n", "v" } },
  { "g,", hidden = true, mode = { "n", "v" } },
  { "g;", hidden = true, mode = { "n", "v" } },
  { "g%", hidden = true, mode = { "n", "v" } },
  { "gu", hidden = true, mode = { "n", "v" } },
  { "gU", hidden = true, mode = { "n", "v" } },
  { "gS", hidden = true, mode = { "v" } },
  { "<leader>gs", "<cmd>GrugFar<cr>", desc = "grug-far", icon = " " },

  { "<leader>a", icon = " " },
  { "<leader>o", icon = "󰛔 " },
  { "<leader>p", icon = "󰍔 " },
  { "<leader>r", icon = "󰘵 " },
  { "<leader>s", icon = " " },
  { "<leader>t", icon = "󰊿 " },
  { "gd", icon = " " },
  { "gh", icon = " " },
  { "gO", icon = " " },
  { "gw", icon = " " },
  { "gi", icon = " ", desc = "Last insert position" },
  { "gv", icon = "󰒅 ", desc = "Last visual position" },
  { "gz", "<cmd>lua Snacks.zen()<cr>", icon = " ", desc = "zen-mode" },
  { "<leader>wc", icon = " ", mode = { "n", "v" } },

  -- gitsigns
  { "<leader>gw", "<cmd>Gitsigns toggle_word_diff<cr>", desc = "Toggle word diff", mode = "n" },
  { "<leader>gl", "<cmd>Gitsigns toggle_linehl<cr>", desc = "Toggle line highlight", mode = "n" },
  { "<leader>gh", "<cmd>Gitsigns preview_hunk_inline<cr>", desc = "Preview git hunk", mode = "n", icon = " " },

  -- fold
  { "zm", require("ufo").closeAllFolds, mode = { "n" }, desc = "Fold all", icon = " " },
  { "zr", require("ufo").openAllFolds, mode = { "n" }, desc = "Unfold all", icon = " " },
  { "za", mode = { "n", "v" }, desc = "Fold block", icon = " " },
  { "zd", mode = { "n", "v" }, desc = "Unfold block", icon = " " },

  -- dim
  {
    "td",
    function()
      if require("snacks.dim").enabled then
        Snacks.dim.disable()
      else
        Snacks.dim.enable()
      end
    end,
    desc = "Toggle Dimming",
  },

  -- colorizea
  { "tc", "<cmd>ColorizerToggle<cr>", desc = "Toggle Colorizea", icon = " " },

  -- multicursor
  { "<leader><up>", desc = "Multcursor ignore line", icon = "󰇀 " },
  { "<leader><down>", desc = "Multcursor ignore line", icon = "󰇀 " },
  { "<leader>k", desc = "Multcursor next", icon = "󰇀 " },
  { "<leader>m", desc = "Multcursor ignore next", icon = "󰇀 " },
  { "<leader>K", desc = "Multcursor pre", icon = "󰇀 " },
  { "<leader>M", desc = "Multcursor ignore pre", icon = "󰇀 " },

  --- mpv
  {"<leader>v", group = "MpvNote", icon = " "}
})
