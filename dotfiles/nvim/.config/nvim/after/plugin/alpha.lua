local alpha = require('alpha')
local dashboard = require('alpha.themes.dashboard')

-- Set header
dashboard.section.header.val = {
     "▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀",
    "  ████████╗███████╗██╗░██╗██╗░░██╗██╗███╗░░░███╗        ",
    "  ╚══██╔══╝██╔════╝██║░██╔╝██║░░██║██║████╗░████║        ",
    "     ██║░░░█████╗░░█████╔╝░██║░░██║██║██╔████╔██║        ",
    "     ██║░░░██╔══╝░░██╔═██╗░╚██╗██╔╝██║██║╚██╔╝██║        ",
    "     ██║░░░███████╗██║░░██╗░╚████╔╝░██║██║░╚═╝░██║        ",
    "     ╚═╝░░░╚══════╝╚═╝░░╚═╝░░╚═══╝░░╚═╝╚═╝░░░░░╚═╝        ",
    "                                                         ",
    "                  ░░░ BEEP BOOP ░░░                  ",
    "              ░░░ TIME TO CODE WOOO ░░░",
    "▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄",

}

-- Set menu
dashboard.section.buttons.val = {
    dashboard.button("e", "  New", "<cmd>ene <CR>"),
    dashboard.button("SPC f f", "  Find file ", "<cmd>Telescope find_files<CR>"),
    dashboard.button("SPC f g", "  File grep", "<cmd>Telescope live_grep<CR>"),
    dashboard.button("SPC f r", "  File recent", "<cmd>Telescope oldfiles<CR>"),
    dashboard.button("SPC s l", "  Last session", "<cmd>SessionRestore<CR>"),
    dashboard.button("SPC f m", "  Bookmarks", "<cmd>Telescope marks<CR>"),
    dashboard.button("u", "  Update plugins", "<cmd>PackerUpdate<CR>"),
    dashboard.button("q", "  Quit", "<cmd>qa<CR>"),
}

-- Set footer
local function footer()
    local datetime = os.date("%d-%m-%Y %H:%M:%S")
    local version = vim.version()
    local nvim_version_info = "  v" .. version.major .. "." .. version.minor .. "." .. version.patch
    
    return datetime .. "  " .. nvim_version_info
end

dashboard.section.footer.val = footer()

-- Settings
dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true

-- Setup
alpha.setup(dashboard.opts)

-- Disable folding on alpha buffer
vim.cmd([[
    autocmd FileType alpha setlocal nofoldenable
]])
