return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	event = "VeryLazy",
	config = function()
		local function lsp_client()
			local clients = vim.lsp.get_clients({ bufnr = 0 })
			if #clients == 0 then
				return "No LSP"
			end
			return "  "
				.. table.concat(
					vim.tbl_map(function(client)
						return client.name
					end, clients),
					", "
				)
		end

		require("lualine").setup({
			options = {
				theme = "auto", -- tu peux changer ici par 'gruvbox', 'tokyonight', etc.
				icons_enabled = true,
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				disabled_filetypes = { "NvimTree", "alpha" },
				globalstatus = true,
			},
			sections = {
				lualine_a = { { "mode", icon = "" } },
				lualine_b = {
					{ "branch", icon = "" },
					{ "diff", symbols = { added = "+", modified = "~", removed = "-" } },
					{
						"diagnostics",
						sources = { "nvim_diagnostic" },
						symbols = { error = " ", warn = " ", info = " ", hint = " " },
					},
				},
				lualine_c = {
					{ "filename", path = 1, symbols = { modified = "●", readonly = "", unnamed = "[No Name]" } },
				},
				lualine_x = {
					lsp_client,
					{ "encoding" },
					{ "fileformat", icons_enabled = true },
					{ "filetype" },
				},
				lualine_y = { { "progress" } },
				lualine_z = { { "location" } },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
			extensions = { "nvim-tree", "lazy", "quickfix", "fugitive", "toggleterm" },
		})
	end,
}
