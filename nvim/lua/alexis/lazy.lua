local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

if vim.g.vscode then
	-- Si on est dans VSCode → ne charger que le strict nécessaire
	require("lazy").setup({
		{ import = "alexis.plugins" },
	})
else
	-- En Neovim classique → charger tout
	require("lazy").setup({
		{ import = "alexis.plugins" },
		{ import = "alexis.plugins.esthetisme" },
		{ import = "alexis.plugins.LSP" },
		{ import = "alexis.plugins.writting" },
		{ import = "alexis.plugins.ai" },
		{ import = "alexis.plugins.git" },
	})
end
