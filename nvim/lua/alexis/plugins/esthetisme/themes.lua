return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		lazy = false,
		config = function()
			require("catppuccin").setup({
				flavour = "mocha",
				integrations = {
					telescope = true,
					which_key = true,
					treesitter = true,
					cmp = true,
					gitsigns = true,
				},
			})
		end,
	},
	{
		"folke/tokyonight.nvim",
		name = "tokyonight",
		lazy = true,
	},
	{
		"EdenEast/nightfox.nvim",
		name = "nightfox",
		lazy = true,
	},
	{ "AmberLehmann/candyland.nvim", name = "candyland", lazy = true },
	{
		"scottmckendry/cyberdream.nvim",
		name = "cyberdream",
		lazy = true,
	},
}
