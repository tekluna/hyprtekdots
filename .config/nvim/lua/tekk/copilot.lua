-- GitHub Copilot configuration for Neovim BY CLAUD AI

-- Basic settings
vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true
vim.g.copilot_tab_fallback = ""

-- Disable copilot for certain filetype
vim.g.copilot_filetypes = {
  ["*"] = false,
  ["javascript"] = true,
  ["typescript"] = true,
  ["lua"] = true,
  ["rust"] = true,
  ["c"] = true,
  ["c++"] = true,
  ["go"] = true,
  ["python"] = true,
  ["java"] = true,
  ["html"] = true,
  ["css"] = true,
  ["scss"] = true,
  ["json"] = true,
  ["yaml"] = true,
  ["markdown"] = true,
  ["sh"] = true,
  ["vim"] = true,
}

-- Key mappings
local keymap = vim.keymap.set
local opts = { silent = true }

-- Accept suggestion
keymap("i", "<C-g>", 'copilot#Accept("<CR>")', { expr = true, replace_keycodes = false })

-- Navigate suggestions
-- keymap("i", "<C-j>", "<Plug>(copilot-next)", opts)
-- keymap("i", "<C-k>", "<Plug>(copilot-previous)", opts)
-- Navigate suggestions (alternative)
keymap("i", "<C-n>", "<Plug>(copilot-next)", opts)
keymap("i", "<C-p>", "<Plug>(copilot-previous)", opts)

-- Accept suggestion with tab
-- keymap("i", "<Tab>", 'copilot#Accept("<Tab>")', { expr = true, replace_keycodes = false })
-- Dismiss suggestion
keymap("i", "<C-]>", "<Plug>(copilot-dismiss)", opts)

-- Suggest completions
keymap("i", "<C-\\>", "<Plug>(copilot-suggest)", opts)

-- Panel commands
keymap("n", "<leader>cp", ":Copilot panel<CR>", opts)

keymap("n", "<leader>ce", ":Copilot enable<CR>", opts)
keymap("n", "<leader>cd", ":Copilot disable<CR>", opts)

-- Auto-commands
vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        -- Check if copilot is authenticated
        vim.defer_fn(function()
            local copilot_status = vim.fn.system("gh auth status")
            if vim.v.shell_error ~= 0 then
                vim.notify("GitHub CLI not authenticated. Run 'gh auth login' to use Copilot.", vim.log.levels.WARN)
            end
        end, 1000)
    end,
})

-- Optional: Configure node path if needed
-- vim.g.copilot_node_command = "/path/to/node"
