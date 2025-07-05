return {
	"https://github.com/LukasPietzschmann/telescope-tabs",
	dependencies = { "nvim-telescope/telescope.nvim" },
	config = function()
		require("telescope").load_extension("telescope-tabs")
		vim.api.nvim_set_keymap(
			"n",
			"<Leader>tt",
			":Telescope telescope-tabs list_tabs<CR>",
			{ noremap = true, silent = true }
		)
	end,
}
