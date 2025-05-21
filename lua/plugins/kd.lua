return {
  "SilverofLight/kd_translate.nvim",
  lazy = true,
  cmd = {"TranslateNormal", "TranslateVisual"},
  config = function()
    require("kd").setup({
      window = {
        width = 50
      }
    })
  end,
  vim.keymap.set("n", "<leader>t", "<cmd>TranslateNormal<CR>"),
  vim.keymap.set("v", "<leader>t", "<cmd>TranslateVisual<CR>")
}
