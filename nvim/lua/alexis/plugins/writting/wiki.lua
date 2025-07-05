return {
  "lervag/wiki.vim",
  config = function()
    -- Configuration du plugin
    vim.g.wiki_root = "/Users/alexisevaristo/Library/Mobile Documents/iCloud~md~obsidian/Documents/Alexis-Vault/Wiki2"
    vim.g.wiki_filetypes = { "md" } -- Utilisation du format Markdown
    vim.g.wiki_index_name = "index"
    vim.g.wiki_toc = {
      depth = 3,
      marker = "[[_TOC_]]",
    }

    -- Keymaps personnalisées
    require("legendary").keymaps({
      { "ww", "<cmd>WikiIndex<CR>", description = "Ouvrir l'index du Wiki" },
      { "we", "<cmd>WikiExport<CR>", description = "Exporter le Wiki" },
      { "ws", "<cmd>WikiJournal<CR>", description = "Ouvrir le journal du Wiki" },
      { "wt", "<cmd>WikiTags<CR>", description = "Afficher les tags du Wiki" },
      { "wl", "<cmd>WikiLocate<CR>", description = "Localiser le fichier actuel dans le Wiki" },
      { "wn", "<cmd>WikiNext<CR>", description = "Aller au fichier suivant dans le Wiki" },
      { "wp", "<cmd>WikiPrev<CR>", description = "Aller au fichier précédent dans le Wiki" },
      { "wr", "<cmd>WikiRename<CR>", description = "Renommer la page actuelle" },
    })
  end,
}
