local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.git_files, {})
vim.keymap.set('n', '<leader>fs', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ")});
    hidden = true
end)
vim.keymap.set("n", "<leader>fl", builtin.buffers, {})  -- "last_buffers" is not a valid picker; use "buffers"
vim.keymap.set("n", "<leader>fr", function()

    builtin.oldfiles({ hidden = true })  -- correct way to pass options

end)
