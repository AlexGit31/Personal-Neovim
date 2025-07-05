return {
	"akinsho/bufferline.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	version = "*",
	opts = {
		options = {
			mode = "buffers",
			separator_style = "padded_slope",
			show_close_icon = false,
			show_buffer_close_icons = true,
			diagnostics = "nvim_lsp",

			-- Icônes
			buffer_close_icon = "",
			modified_icon = "●",
			close_icon = "",
			left_trunc_marker = "",
			right_trunc_marker = "",

			-- Enlève le soulignement (underline) du buffer sélectionné
			-- indicator = {
			-- 	style = "none", -- désactive l'indicateur visuel (ex: soulignement ou bloc)
			-- },

			-- Hover events : affichage du bouton "fermer" quand la souris survole
			hover = {
				enabled = true,
				delay = 50,
				reveal = { "close" }, -- affiche le bouton close au survol
			},

			-- Groupe de buffers
			groups = {
				options = {
					toggle_hidden_on_enter = true,
				},
				items = {
					{
						name = " Markdown",
						highlight = { sp = "#8a79c3" },
						matcher = function(buf)
							return buf.name:match("%.md$")
						end,
					},
				},
			},

			-- Diagnostics LSP (si activé)
			--diagnostics = "nvim_lsp",
			-- diagnostics_update_in_insert = false,
			-- diagnostics_indicator = function(count, level)
			-- 	local icon = (level:match("error") and " " or " ")
			-- 	return " " .. icon .. count
			-- end,
		},
	},
}
