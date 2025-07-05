return{
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl", -- depuis la v3.x
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    indent = {
      char = "│",  -- Choix du caractère de l'indentation (ex: "│", "▏", "⸽", "┊", "╎", "⋮")
      tab_char = "│",
      smart_indent_cap = true,
      priority = 1,
    },
    scope = {
      enabled = true,
      show_start = false,
      show_end = false,
      injected_languages = true,
      highlight = { "Function", "Label" }, -- Couleurs selon le scope
      include = {
        node_type = {
          ["*"] = { "body", "argument_list", "expression" }
        }
      }
    },
    exclude = {
      filetypes = {
        "help", "dashboard", "lazy", "NvimTree",
        "Trouble", "alpha", "neo-tree", "terminal"
      },
      buftypes = { "terminal", "nofile" },
    },
    whitespace = {
      remove_blankline_trail = true, -- Nettoie les trailing blanklines
    },
  },
}
