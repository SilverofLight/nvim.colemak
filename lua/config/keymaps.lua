local key = vim.keymap
vim.g.mapleader = " "

-- key.set("i", "jk", "<ESC>")
-- key.set("i", "<C-e>", "<Esc>A")
-- key.set("i", "<C-a>", "<Esc>I")
key.set("i", "<C-q>", "<++>")
key.set("i", "<esc>", "<esc>")
key.set("n", "<esc>", "<cmd>nohl<CR>")
key.set("n", "S", "<cmd>w<CR>")

-- disable q
key.set('n', 'Q', "q")
key.set('n', 'q', "<nop>")

-- key.set("n", "s", "<nop>")

key.set("n", "<leader>o", "/<++><CR><cmd>nohl<CR>c4l", { desc = "replace next <++>" })
-- key.set("n", "<leader>i", "?<++><CR><cmd>nohl<CR>c4l")

-- quick quit
key.set("n", "<leader>qq", "<cmd>quitall<cr>", { desc = "Quitall" })
key.set("n", "<leader>wq", "<cmd>wq<cr>", { desc = "Save and quit" })

-- easy way to go to the end of a line
key.set("n", "<leader>s", "$", { desc = "End of line" })
key.set("v", "<leader>s", "$", { desc = "End of line" })
key.set("n", "<leader>a", "0", { desc = "Begin of line" })
key.set("v", "<leader>a", "0", { desc = "Begin of line" })

-- 窗口切换
key.set("n", "<leader>h", "<C-w>h", { desc = "Window left" })
key.set("n", "<leader>n", "<C-w>j", { desc = "Window down" })
key.set("n", "<leader>e", "<C-w>k", { desc = "Window up" })
key.set("n", "<leader>i", "<C-w>l", { desc = "Window right" })

-- window resize
key.set("n", "<C-up>", "<cmd>res +2<CR>")
key.set("n", "<C-down>", "<cmd>res -2<CR>")
key.set("n", "<C-left>", "<cmd>vertical resize -2<CR>")
key.set("n", "<C-right>", "<cmd>vertical resize +2<CR>")

-- move lines
-- key.set("v", "J", "<cmd>m '>+1<CR>gv=gv")
-- key.set("v", "K", "<cmd>m '<-2<CR>gv=gv")

-- exit v mode
-- key.set("v", "io", "<ESC>")

-- add split
key.set("n", "<leader>|", "<C-w>v", { desc = "Split window right" })
key.set("n", "<leader>-", "<C-w>s", { desc = "Split window down" })

-- ; -> :
key.set("n", ";", ":")

-- better J K
key.set("n", "<C-n>", "5gj")
key.set("n", "<C-e>", "5gk")
key.set("v", "<C-n>", "5gj")
key.set("v", "<C-e>", "5gk")
key.set("n", "<C-h>", "8h")
key.set("n", "<C-i>", "8l")
key.set("v", "<C-h>", "8h")
key.set("v", "<C-i>", "8l")

key.set("v", "n", "gj")
key.set("v", "e", "gk")

-- better jk
key.set({ "n", "x" }, "n", function()
  if vim.fn.line(".") == vim.fn.line("$") then
    return vim.api.nvim_replace_termcodes("<C-e>", true, true, true)
  elseif vim.v.count == 0 then
    return "gj"
  else return "j"
  end
end, { desc = "Down (scroll if at EOF)", expr = true, silent = true })
key.set({ "n", "x" }, "e", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })

key.set("n", "i", "l")
key.set("v", "i", "l")

key.set("n", "k", "n")
key.set("v", "k", "n")
key.set("n", "K", "N")
key.set("v", "K", "N")

key.set("n", "<C-p>", "<C-e>")

-- d c y comboo
key.set("n", "di", "dl")
key.set("n", "dn", "dj")
key.set("n", "de", "dk")
key.set("n", "d2n", "d2j")
key.set("n", "d2e", "d2k")

key.set("n", "ci", "cl")
key.set("n", "cn", "cj")
key.set("n", "ce", "ck")
key.set("n", "c2n", "c2j")
key.set("n", "c2e", "c2k")

key.set("n", "yi", "yl")
key.set("n", "yn", "yj")
key.set("n", "ye", "yk")
key.set("n", "y2n", "y2j")
key.set("n", "y2e", "y2k")

key.set("n", "u", "i")
key.set("n", "U", "I")
key.set("n", "l", "u")

key.set("n", "<C-t>", "e")
key.set("v", "<C-t>", "e")

key.set("n", "<C-l>", "<C-u>")
key.set("v", "<C-l>", "<C-u>")

key.set("n", "<C-j>", "<C-i>")

-- arround & in
key.set("n", "c;", "ci")
key.set("n", "d;", "di")

-- tab
key.set("n", "tu", "<cmd>tabnew<cr>", { desc = "Tabnew" })
key.set("n", "N", "<cmd>tabprevious<cr>")
key.set("n", "E", "<cmd>tabnext<cr>")

-- hop config
key.set("n", "s", "<cmd>HopWord<CR>")
key.set("v", "s", "<cmd>HopWord<CR>")

-- togglewrap
function ToggleWrap()
    if vim.opt.wrap:get() then
        vim.opt.wrap = false
    else
        vim.opt.wrap = true
    end
end

key.set("n", "<leader>wr", [[<cmd>lua ToggleWrap()<CR>]], { desc = "Toggle Wrap" })

function ToggleSpell()
    if vim.opt.spell:get() then
        vim.opt.spell = false
    else
        vim.opt.spell = true
    end
end

key.set("n", "<leader>us", [[<cmd>lua ToggleSpell()<CR>]], { desc = "Toggle Spell" })

-- terminal
-- key.set("n", "<leader>gt", "<cmd>vsplit term://fish<CR>", { desc = "Terminal" })
-- key.set("t", "<C-s>", "<C-\\><C-n>")

-- markdown preview
key.set("n", "<leader>p", "<cmd>MarkdownPreview<CR>", { desc = "MarkdownPreview" })

-- buffer
key.set("n", "H", "<cmd>BufferLineCyclePrev<CR>")
key.set("n", "I", "<cmd>BufferLineCycleNext<CR>")
key.set("n", "<leader>bc", "<cmd>BufferLinePickClose<CR>", { desc = "Buffer pick close" })
key.set("n", "<leader>bp", "<cmd>BufferLinePick<CR>", { desc = "Buffer pick" })
key.set("n", "<leader>bd", "<cmd>bdelete<CR>", { desc = "Buffer delete" })

-- Telescope
vim.keymap.set('n', '<leader><leader>', "<cmd>Telescope find_files<CR>", { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>ff', "<cmd>Telescope live_grep<CR>", { desc = 'Telescope find contents' })
vim.keymap.set('n', '<leader>fg', "<cmd>Telescope git_files<CR>", { desc = 'Telescope find files in git' })

-- lean
-- vim.keymap.set('i', '<C-o>', '<ESC>o(<ESC>klywjp<C-a>a: )<ESC>i')
-- notify history
key.set("n", "<leader>,", "<cmd>lua Snacks.notifier.show_history()<cr>", { desc = "Notifier history" })
