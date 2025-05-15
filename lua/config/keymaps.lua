local key = vim.keymap
vim.g.mapleader = " "

-- key.set("i", "jk", "<ESC>")
-- key.set("i", "<C-e>", "<Esc>A")
-- key.set("i", "<C-a>", "<Esc>I")
key.set("i", "<C-q>", "<++>")
key.set("i", "<esc>", "<esc>")
key.set("n", "<esc>", "<cmd>nohl<CR>")
key.set("n", "S", "<cmd>w<CR>")

-- key.set("n", "s", "<nop>")

key.set("n", "<leader>o", "/<++><CR><cmd>nohl<CR>c4l")
-- key.set("n", "<leader>i", "?<++><CR><cmd>nohl<CR>c4l")

-- quick quit
key.set("n", "<leader>qq", "<cmd>quitall<cr>")
key.set("n", "<leader>wq", "<cmd>wq<cr>")

-- easy way to go to the end of a line
key.set("n", "<leader>s", "$")
key.set("v", "<leader>s", "$")
key.set("n", "<leader>a", "0")
key.set("v", "<leader>a", "0")

-- 窗口切换
key.set("n", "<leader>h", "<C-w>h")
key.set("n", "<leader>n", "<C-w>j")
key.set("n", "<leader>e", "<C-w>k")
key.set("n", "<leader>i", "<C-w>l")

-- window resize
key.set("n", "<up>", "<cmd>res +2<CR>")
key.set("n", "<down>", "<cmd>res -2<CR>")
key.set("n", "<left>", "<cmd>vertical resize -2<CR>")
key.set("n", "<right>", "<cmd>vertical resize +2<CR>")

-- move lines
-- key.set("v", "J", "<cmd>m '>+1<CR>gv=gv")
-- key.set("v", "K", "<cmd>m '<-2<CR>gv=gv")

-- exit v mode
-- key.set("v", "io", "<ESC>")

-- add split
key.set("n", "<leader>|", "<C-w>v")
key.set("n", "<leader>-", "<C-w>s")

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

key.set("n", "n", "gj")
key.set("n", "e", "gk")
key.set("v", "n", "gj")
key.set("v", "e", "gk")

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

-- tab
key.set("n", "tu", "<cmd>tabnew<cr>")
key.set("n", "N", "<cmd>tabprevious<cr>")
key.set("n", "E", "<cmd>tabnext<cr>")

-- hop config
key.set("n", "s", "<cmd>HopWord<CR>")

-- togglewrap
function ToggleWrap()
    if vim.opt.wrap:get() then
        vim.opt.wrap = false
    else
        vim.opt.wrap = true
    end
end

key.set("n", "<leader>wr", [[<cmd>lua ToggleWrap()<CR>]])

function ToggleSpell()
    if vim.opt.spell:get() then
        vim.opt.spell = false
    else
        vim.opt.spell = true
    end
end

key.set("n", "<leader>us", [[<cmd>lua ToggleSpell()<CR>]])

-- terminal
key.set("n", "<leader>gt", "<cmd>vsplit term://fish<CR>")
key.set("t", "<C-s>", "<C-\\><C-n>")

-- markdown preview
key.set("n", "<leader>p", "<cmd>MarkdownPreview<CR>")

-- buffer
key.set("n", "H", "<cmd>BufferLineCyclePrev<CR>")
key.set("n", "I", "<cmd>BufferLineCycleNext<CR>")
key.set("n", "<leader>bc", "<cmd>BufferLinePickClose<CR>")
key.set("n", "<leader>bp", "<cmd>BufferLinePick<CR>")
key.set("n", "<leader>bd", "<cmd>bdelete<CR>")

-- Telescope
vim.keymap.set('n', '<leader><leader>', "<cmd>Telescope find_files<CR>", { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>ff', "<cmd>Telescope live_grep<CR>", { desc = 'Telescope find contents' })
vim.keymap.set('n', '<leader>fg', "<cmd>Telescope git_files<CR>", { desc = 'Telescope find files in git' })

-- lean
-- vim.keymap.set('i', '<C-o>', '<ESC>o(<ESC>klywjp<C-a>a: )<ESC>i')
