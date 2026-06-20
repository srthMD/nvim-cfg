local function apply_scheme(colorscheme)
  local suc, _ = pcall(vim.cmd.colorscheme, colorscheme)

  return suc
end

local main_scheme = "vorange"
local backup_schemes = { "base16-darkmoss", "evergarden-fall", "kanagawa-dragon", "slate" }

if not apply_scheme(main_scheme) then
  for _, scheme in pairs(backup_schemes) do
    if not apply_scheme(scheme) then
      vim.notify("Failed to apply color scheme " .. scheme)
    else  
      vim.notify("Falling back to colorscheme " .. scheme .. ", failed to apply " .. main_scheme)
      break
    end
  end
end
