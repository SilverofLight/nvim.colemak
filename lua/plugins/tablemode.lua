return {
  "dhruvasagar/vim-table-mode",

  -- vim.keymap.set("n", "tm", "<cmd>TableModeToggle<CR>", { desc = "Toggle Table Mode" }),
  config = function()
    local Snacks = require("snacks")

    Snacks.toggle({
      name = "Table Mode",
      get = function()
        return not vim.g.loaded_table_mode
      end,
      set = function(state)
        vim.g.loaded_table_mode = not state
        vim.cmd("TableModeToggle")
      end,
    }):map("tm")
  end
}
