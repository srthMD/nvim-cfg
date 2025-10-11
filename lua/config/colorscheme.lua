local function apply_scheme(colorscheme)
  local suc, _ = pcall(vim.cmd.colorscheme, colorscheme)

  return suc
end

-- first scheme is the main one, others are backups
local schemes = { "base16-darkmoss", "evergarden-fall", "kanagawa-dragon", "slate" }

for _, scheme in pairs(schemes) do
  if not apply_scheme(scheme) then
    vim.notify("Failed to apply color scheme " .. scheme)
  else
    break
  end
end
