-- lazy.lua ou dans ton setup Lazy
return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000, -- important pour qu’il soit chargé avant les autres
	config = function()
		require("catppuccin").setup({
			flavour = "mocha", -- latte, frappe, macchiato, mocha
			-- customisation éventuelle ici
		})
		vim.cmd.colorscheme("catppuccin")
	end,
}
