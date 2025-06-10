-- lazy.nvim
return {
  "folke/snacks.nvim",
  ---@type snacks.Config
  opts = {
    image = {
      -- your image configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      doc = {
        max_height = 20,
      }
    },
    indent = {
      -- your indent configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    quickfile = {

    },
    dashboard = {
      -- your dashboard configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    notifier = {
      top_down = false,
      margin = { top = 0, right = 1, bottom = 2 }
    },
    terminal = {
      win = {
        -- style = "terminal",
        position = "float",
        width = 0.4,
        height = 0.85,
        col = 0.55,
        row = 0.1,
        border = "rounded"
      },
      wo = {
      },
      vim.keymap.set("n", "<leader>gt",
        function()
          Snacks.terminal.toggle()
        end, { desc = "Terminal" }),
      vim.keymap.set("t", "<C-/>", "<cmd>close<cr>", { desc = "Hide Terminal" }),
      vim.keymap.set("n", "<C-/>", "<cmd>lua Snacks.terminal.toggle()<cr>", { desc = "Toggle Terminal" }),
    },
    words = {
      vim.keymap.set("n", "gw", "<cmd>lua Snacks.words.jump()<cr>", { desc = "Next Reference" }),
    }
  }
}
