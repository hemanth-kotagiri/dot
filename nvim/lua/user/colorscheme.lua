local colorscheme = "tokyonight"

if colorscheme == "tokyonight" then
  vim.g.tokyonight_style = "night"
end

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end
