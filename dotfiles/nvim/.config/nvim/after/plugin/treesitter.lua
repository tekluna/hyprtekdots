require'nvim-treesitter.configs'.setup {
	-- A list of parser names, or "all" (the listed parsers MUST always be installed)
	ensure_installed = {"python", "javascript", "go", "typescript","c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline"},

	sync_install = false,

	auto_install = true,

	highlight = {
		enable = true,
	},
    textobjects = {
        enable = false,
    }
}

