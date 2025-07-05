return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
		"folke/todo-comments.nvim",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		telescope.setup({
			defaults = {
				path_display = { "smart" },
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous, -- move to prev result
						["<C-j>"] = actions.move_selection_next, -- move to next result
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
					},
				},
			},
		})

		telescope.load_extension("fzf")

		-- set keymaps
		local keymap = vim.keymap -- for conciseness

		-- keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
		-- keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
		-- keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
		-- keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
		-- keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })
	end,
	keys = {
		{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Fuzzy find files in cwd" },
		{ "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Fuzzy find recent files" },
		{ "<leader>fs", "<cmd>Telescope live_grep<cr>", desc = "Find string in cwd" },
		{ "<leader>fc", "<cmd>Telescope grep_string<cr>", desc = "Find string under cursor in cwd" },
		{ "<leader>ft", "<cmd>TodoTelescope<cr>", desc = "Find todos" },
	},
	require("telescope").setup({
		defaults = {
			sorting_strategy = "ascending", -- Trie du haut vers le bas
			-- layout_strategy = "vertical", -- Affichage en colonne
			layout_config = {
				width = 0.9, -- Ajuster la largeur de la fenêtre
				height = 0.8, -- Ajuster la hauteur de la fenêtre
				preview_cutoff = 10, -- Afficher le preview même si la fenêtre est petite
			},
			previewer = true, -- Activer la prévisualisation
		},
		extensions = {
			neoclip = {
				preview = true, -- Activer la preview des clips
				enable_persistent_history = true,
				-- layout_strategy = "horizontal", -- Option pour rendre l'affichage plus compact
				layout_config = {
					prompt_position = "top",
					preview_cutoff = 20,
					width = 0.8,
					height = 0.7,
				},
			},
		},
	}),
}
