local CYAUI = {}
CYAUI.__index = CYAUI

local Components = loadstring(game:HttpGet("https://raw.githubusercontent.com/PHGS971/CYA-UI/main/modules/Components.lua"))()
local ThemeManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/PHGS971/CYA-UI/main/modules/ThemeManager.lua"))()
local IntroFade = loadstring(game:HttpGet("https://raw.githubusercontent.com/PHGS971/CYA-UI/main/animations/IntroFade.lua"))()

function CYAUI:CreateWindow(settings)
    IntroFade()

    local window = Components.CreateBase(settings)
    ThemeManager.ApplyTheme(window, settings.Theme or "Dark")
    return window
end

return CYAUI
