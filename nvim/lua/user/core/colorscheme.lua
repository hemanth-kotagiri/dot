local colorscheme = "ayu-dark"

if colorscheme == "gruvbox" then
	vim.o.background = "dark" end

if colorscheme == "tokyonight" then
	vim.g.tokyonight_style = "night"
end

if colorscheme == "material" then
	--[[ vim.g.material_style = "palenight" ]]
	--[[ vim.g.material_style = "darker" ]]
	vim.g.material_style = "deep ocean"
end

if colorscheme == "neon" then
	vim.g.neon_style = "dark"
end

if colorscheme == "catppuccin" then
	vim.g.catppuccin_flavour = "mocha"
end

if colorscheme == "neon" then
	vim.g.neon_style = "dark"
	vim.g.neon_italic_keyword = true
	vim.g.neon_italic_function = true
	vim.g.neon_transparent = false
end

if colorscheme == 'aurora' then
  vim.g.aurora_italic = true
  vim.g.aurora_transparent = false
  vim.g.aurora_bold = true
  vim.g.aurora_darker = true
end

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not status_ok then
	vim.notify("colorscheme " .. colorscheme .. " not found!")
	return
end

-- require('colorbuddy').colorscheme('nvim-rdark')
-- require('colorbuddy').colorscheme('gruvbuddy')
