return {
  "norcalli/nvim-colorizer.lua",
  config = function()
    require("colorizer").setup({
      "python",
      "c",
      "html",
      "css",
      "javascript",
    }, {
      names = true, -- Ne colore pas les noms comme "red", "blue", etc.
      RGB = true, -- Active la coloration pour les valeurs RGB
      RRGGBB = true, -- Active la coloration pour les valeurs HEX
      css = true, -- Active la coloration dans les propriétés CSS
      css_fn = true, -- Active la coloration dans les fonctions CSS (comme `rgba()`)
    })

    -- Désactivation automatique dans les fichiers non liés au code
    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "markdown", "text", "txt", "json" },
      callback = function()
        require("colorizer").detach_from_buffer(0)
      end,
    })
  end,
}
