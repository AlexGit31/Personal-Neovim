local M = {}

M.themes = {
	"catppuccin",
	"tokyonight",
	"nightfox",
	"tokyonight_custom",
	"DarkTokyo",
	"candyland",
	"cyberdream",
}

function M.apply(theme)
	if theme == "tokyonight_custom" then
		-- Assure que le plugin est bien chargé
		vim.cmd("colorscheme tokyonight") -- nécessaire si Lazy charge après
		vim.notify("🎨 Thème personnalisé TokyoNight chargé", vim.log.levels.INFO)
		return
	end

	if theme == "DarkTokyo" then
		-- Assure que le plugin est bien chargé
		vim.cmd("colorscheme tokyodark") -- nécessaire si Lazy charge après
		vim.notify("🎨 Thème personnalisé DarkTokyoNight chargé", vim.log.levels.INFO)
		return
	end

	local ok, _ = pcall(vim.cmd.colorscheme, theme)
	if ok then
		vim.notify("🎨 Thème activé : " .. theme, vim.log.levels.INFO)
	else
		vim.notify("❌ Thème introuvable : " .. theme, vim.log.levels.ERROR)
	end
end

return M
