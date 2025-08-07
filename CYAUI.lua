--// CYA UI - Sistema de Interface para Roblox
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local CYAUI = {}

-- Fade inicial (CYA UI)
function CYAUI:PlayIntro(callback)
    local gui = Instance.new("ScreenGui", LocalPlayer:WaitForChild("PlayerGui"))
    gui.IgnoreGuiInset = true
    gui.Name = "CYA_UI_Intro"

    local transition = Instance.new("Frame", gui)
    transition.BackgroundColor3 = Color3.new(0, 0, 0)
    transition.BackgroundTransparency = 1
    transition.Size = UDim2.new(1, 0, 1, 0)
    transition.Position = UDim2.new(-1, 0, 0, 0)
    transition.ZIndex = 1000

    local cyaText = Instance.new("TextLabel", transition)
    cyaText.Size = UDim2.new(1, 0, 1, 0)
    cyaText.BackgroundTransparency = 1
    cyaText.Text = "CYA UI"
    cyaText.TextColor3 = Color3.fromRGB(255, 255, 255)
    cyaText.Font = Enum.Font.GothamBlack
    cyaText.TextScaled = true
    cyaText.TextTransparency = 1
    cyaText.ZIndex = 1001

    transition.Visible = true

    -- Tween de slide e fade
    TweenService:Create(transition, TweenInfo.new(0.5), {
        Position = UDim2.new(0, 0, 0, 0),
        BackgroundTransparency = 0.1
    }):Play()

    task.delay(0.5, function()
        TweenService:Create(cyaText, TweenInfo.new(0.5), {
            TextTransparency = 0
        }):Play()
    end)

    task.delay(2, function()
        gui:Destroy()
        if callback then callback() end
    end)
end

-- Função para criar a janela principal
function CYAUI:CreateWindow(config)
    local WindowModule = loadstring(game:HttpGet("https://raw.githubusercontent.com/PHGS971/CYA-UI/main/Library/Window.lua"))()
    return WindowModule:Init(config)
end

return CYAUI
