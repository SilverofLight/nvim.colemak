return {
  "SilverofLight/MpvNote.nvim",
  lazy = true,
  cmd = { "MpvCopyStamp", "MpvPasteStamp", "MpvOpenStamp" },
  opts = {
    socket = "/tmp/mpvsocket",
    clipboard_cmd = "wl-copy"
  },

  -- set your keybindings below
  vim.keymap.set("n", "<leader>vc", "<cmd>MpvCopyStamp<CR>", { desc = "Copy Mpv Note" }),
  vim.keymap.set("n", "<leader>vp", "<cmd>MpvPasteStamp<CR>", { desc = "Paste Mpv Note" }),
  vim.keymap.set("n", "<leader>vo", "<cmd>MpvOpenStamp<CR>", { desc = "Open Mpv Note" })
}
