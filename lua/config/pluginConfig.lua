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


vim.keymap.set('n', '<leader>fm', ":lua vim.lsp.buf.format { async = true }<CR>", { desc = "Lsp format" })
vim.keymap.set('n', 'gd', ":lua vim.lsp.buf.definition()<CR>", { desc = "Goto Definition" })
vim.keymap.set('n', '<leader>ca', ":lua vim.lsp.buf.code_action()<CR>", { desc = "Code action" })
vim.keymap.set('n', '<leader>r', ":lua vim.lsp.buf.rename()<CR>", { desc = "Lsp Rename" })
vim.keymap.set('n', 'gh', ":lua vim.lsp.buf.hover()<CR>", { desc = "Lsp Hover" })
vim.keymap.set('n', 'gl', ":lua vim.diagnostic.open_float()<CR>", { desc = "Diagnostic" })
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
    require("bufferline").setup {}

-- git signs
require('gitsigns').setup {
  on_attach = function(bufnr)
    local gitsigns = require('gitsigns')

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map('n', ']c', function()
      if vim.wo.diff then
        vim.cmd.normal({ ']c', bang = true })
      else
        gitsigns.nav_hunk('next')
      end
    end)

    map('n', '[c', function()
      if vim.wo.diff then
        vim.cmd.normal({ '[c', bang = true })
      else
        gitsigns.nav_hunk('prev')
      end
    end)
  end
}

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
  { "<leader>f", group = "Telescope, Aerial & lsp" },
  { "<leader>c", group = "Lsp", icon = " " },
  { "<leader>g", group = "Terminal" },
  { "<leader>q", group = "Quit" },
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

  { "<leader>a", icon = " " },
  { "<leader>o", icon = "󰛔 " },
  { "<leader>p", icon = "󰍔 " },
  { "<leader>r", icon = "󰘵 " },
  { "<leader>s", icon = " " },
  { "<leader>t", icon = "󰊿 " },
  { "gd", icon = " " },
  { "gh", icon = " " },
  { "gO", icon = " " },
  { "gi", icon = " ", desc = "Last insert position" },
  { "gv", icon = "󰒅 ", desc = "Last visual position" },
  { "<leader>wc", icon = " ", mode = { "n", "v" } },
})

-- lualine
require("lualine").setup {
  options = { theme = 'dracula-nvim' },
}
