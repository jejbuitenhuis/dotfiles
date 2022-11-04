require('nvim-treesitter.configs').setup({
	ensure_installed = {
		"bash",
		"comment",
		"css",
		"java",
		"javascript",
		"jsdoc",
		"typescript",
		"yaml",
	},
	highlight = {
		enable = true,
		disable = {
			"help", -- help colors aren't correct at the moment
		},
	},
})
