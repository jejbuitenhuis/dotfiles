require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"comment",
		"lua",
	},
	highlight = {
		enable = true,
		disable = {
			"help",
		},
	},
})
