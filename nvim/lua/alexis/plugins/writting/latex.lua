return {
  "lervag/vimtex",
  config = function()
    vim.g.vimtex_view_method = "skim" -- Ou "skim" sur macOS
    vim.g.vimtex_compiler_method = "latexmk"
  end,
  ft = { "tex" },
}
