vim.g.mapleader = " "

-- i hate hate hate the ESC key
vim.keymap.set('i', 'jjk', '<Esc>')
vim.keymap.set('c', 'jjk', '<C-c>')
vim.keymap.set('v', 'jjk', '<Esc>')
vim.keymap.set('t', 'jjk', '<C-\\><C-n>')

vim.keymap.set("n","<leader>cm",":")

vim.keymap.set("n","<leader>xf", vim.cmd.NvimTreeToggle)

-- auto double stuff
vim.keymap.set('i', '(', '()<ESC>i')
vim.keymap.set('i', '[', '[]<ESC>i')
vim.keymap.set('i', '{', '{}<ESC>i')

--those might be annoying
vim.keymap.set('i', '"', '""<ESC>i')
vim.keymap.set('i', "'", "''<ESC>i")

vim.keymap.set("n", "<C-d>", "<C-d>zz")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", "\"_dP")

-- next greatest remap ever : asbjornHalanj
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set("n", "<leader>chmod", "<cmd>!chmod +x %<CR>", { silent = true })

-- git gutter doesnt work at all yet
vim.keymap.set("n", "<leader>gtg", vim.cmd.GitGutterEnable)
