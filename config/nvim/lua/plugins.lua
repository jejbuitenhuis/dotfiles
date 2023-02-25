return require("packer").startup( function(use)
	-- let packer manage itself
	use "wbthomason/packer.nvim"

	-- autoclose tags
	use "jiangmiao/auto-pairs"

	-- git
	use {
		"lewis6991/gitsigns.nvim",
		requires = { "nvim-lua/plenary.nvim" },
	}
	use "tpope/vim-fugitive"

	-- surround motions with braces etc
	use "tpope/vim-surround"

	-- show open editor on top right of buffer
	use "b0o/incline.nvim"

	-- open file with fuzzy finder
	use {
		"nvim-telescope/telescope.nvim",
		requires = { "nvim-lua/plenary.nvim" },
	}

	-- highlight colors in file
	use {
		"rrethy/vim-hexokinase",
		run = "make hexokinase",
	}

	-- comments made easy
	use "tpope/vim-commentary"

	-- highlight `f` and `t` keys
	use "unblevable/quick-scope"

	-- scroll to the line were the file was closed the last time
	use "farmergreg/vim-lastplace"

	-- syntax
	use {
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	}
end )
