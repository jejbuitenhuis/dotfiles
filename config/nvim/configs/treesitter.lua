require('nvim-treesitter.configs').setup({
	ensure_installed = {
		"bash",
		"comment",
		"css",
		"java",
		"javascript",
		"jsdoc",
		"scss",
		"typescript",
		"yaml",
	},
	highlight = {
		enable = true,
	},
})
